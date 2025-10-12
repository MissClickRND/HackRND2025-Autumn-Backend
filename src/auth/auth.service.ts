import { Injectable, UnauthorizedException } from '@nestjs/common';
import { RegisterDtoRequest } from './dto/request/register.dto';
import { PrismaService } from 'src/prisma/prisma.service';
import { JwtService } from '@nestjs/jwt';
import { UsersService } from 'src/users/users.service';
import { LoginDtoRequest } from './dto/request/loginReq.dto';
import { LoginResDTO } from 'src/users/dto/response/loginRes.dto';
import { retry } from 'rxjs';

@Injectable()
export class AuthService {
  constructor(
    private readonly prismaService: PrismaService,
    private readonly jwtService: JwtService,
    private readonly usersService: UsersService,
  ) {}

  async register(dto: RegisterDtoRequest) {
    const user = await this.usersService.create(dto);
    return user;
  }

  async login(dto: LoginResDTO) {
    const payload = { email: dto.email, sub: dto.id };
    const accessToken = await this.jwtService.sign(payload);

    const refreshToken = await this.jwtService.sign(payload, {
      secret: process.env.JWT_REFRESH_SECRET,
      expiresIn: '7d',
    });

    const expiresAt = new Date();
    expiresAt.setDate(expiresAt.getDate() + 7);

    await this.prismaService.refreshToken.create({
      data: {
        token: refreshToken,
        userId: dto.id,
        system: dto.system,
        expiresAt,
      },
    });

    return { accessToken: accessToken, refreshToken: refreshToken };
  }

  async refresh(refreshToken: string) {
    if (!refreshToken) {
      throw new UnauthorizedException('Refresh token отсутствует');
    }

    let payload;
    try {
      payload = this.jwtService.verify(refreshToken, {
        secret: process.env.JWT_REFRESH_SECRET,
      });
    } catch (error) {
      throw new UnauthorizedException('Невалидный refresh token');
    }

    const storedToken = await this.prismaService.refreshToken.findUnique({
      where: { token: refreshToken },
      include: { user: true },
    });

    if (!storedToken || storedToken.expiresAt < new Date()) {
      throw new UnauthorizedException('Refresh token просрочен или отозван');
    }

    const { id: userId, email } = storedToken.user;
    const system = storedToken.system;

    const newAccessToken = this.jwtService.sign({ sub: userId, email });
    const newRefreshToken = this.jwtService.sign(
      { sub: userId, email },
      {
        secret: process.env.JWT_REFRESH_SECRET,
        expiresIn: '7d',
      },
    );

    const newExpiresAt = new Date();
    newExpiresAt.setDate(newExpiresAt.getDate() + 7);

    await this.prismaService.$transaction([
      this.prismaService.refreshToken.delete({ where: { id: storedToken.id } }),
      this.prismaService.refreshToken.create({
        data: {
          token: newRefreshToken,
          userId,
          system,
          expiresAt: newExpiresAt,
        },
      }),
    ]);

    return {
      accessToken: newAccessToken,
      refreshToken: newRefreshToken,
    };
  }

  async logoutThis(refreshToken: string) {
    if (!refreshToken){
      return
    }
    await this.prismaService.refreshToken.deleteMany({
      where: { token: refreshToken },
    });
  }
}
