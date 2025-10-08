import { Injectable } from '@nestjs/common';
import { RegisterDtoRequest } from './dto/request/register.dto';
import { PrismaService } from 'src/prisma/prisma.service';
import { LoginResDTO } from 'src/users/dto/response/loginRes.dto';
import { JwtService } from '@nestjs/jwt';

@Injectable()
export class AuthService {
  constructor(
    private readonly prismaService: PrismaService,
    private readonly jwtService: JwtService,
  ) {}

  async register(dto: RegisterDtoRequest) {
    return '';
  }

  async login(user: LoginResDTO) {
    const payload = { email: user.email, sub: user.id };
    const accessToken = await this.jwtService.sign(payload);

    const refreshToken = await this.jwtService.sign(payload, {
      secret: process.env.JWT_REFRESH_SECRET,
      expiresIn: '7d',
    });
  }
}
