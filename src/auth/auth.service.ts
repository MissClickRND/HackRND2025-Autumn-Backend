import { Injectable } from '@nestjs/common';
import { RegisterDtoRequest } from './dto/request/register.dto';
import { PrismaService } from 'src/prisma/prisma.service';
import { JwtService } from '@nestjs/jwt';
import { UsersService } from 'src/users/users.service';
import { LoginDtoRequest } from './dto/request/loginRes.dto';

@Injectable()
export class AuthService {
  constructor(
    private readonly prismaService: PrismaService,
    private readonly jwtService: JwtService,
    private readonly usersService: UsersService,
  ) {}

  async register(dto: RegisterDtoRequest) {
    const user = await this.usersService.create(dto);
    return { message: 'Пользователь зарегистрирован'};
  }

  async login(dto: any) {
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
        expiresAt,
      },
    });

    return { accessToken: accessToken, refreshToken: refreshToken };
  }
}
