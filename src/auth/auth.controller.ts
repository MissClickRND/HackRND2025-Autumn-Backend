import {
  Body,
  Controller,
  Get,
  Headers,
  Post,
  Request,
  Res,
  UseGuards,
} from '@nestjs/common';
import { ApiBody, ApiOperation } from '@nestjs/swagger';
import { AuthService } from './auth.service';
import { RegisterDtoRequest } from './dto/request/register.dto';
import { AuthGuard } from '@nestjs/passport';
import type { Response } from 'express';
import { JwtAuthGuard } from 'src/jwt/jwt-auth.guard';
import { LoginDtoRequest } from './dto/request/loginReq.dto';
import { System } from '@prisma/client';

@Controller()
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @ApiOperation({ summary: 'Регистрация' })
  @Post('register')
  async Reg(
    @Body() dto: RegisterDtoRequest,
    @Headers('x-client-type') system: System,
    @Res({ passthrough: true }) res: Response,
  ) {
    const user = await this.authService.register(dto);

    const { accessToken, refreshToken } = await this.authService.login({
      id: user.id,
      email: user.email,
      system: system,
    });

    res.cookie('refreshToken', refreshToken, {
      httpOnly: true,
      sameSite: 'strict',
      maxAge: 7 * 24 * 60 * 60 * 1000,
    });

    return { user: user, token: accessToken };
  }

  @ApiOperation({ summary: 'Авторизация' })
  @ApiBody({ type: LoginDtoRequest })
  @UseGuards(AuthGuard('local'))
  @Post('login')
  async Auth(
    @Request() req,
    @Headers('x-client-type') system: System,
    @Res({ passthrough: true }) res: Response,
  ) {
    const { accessToken, refreshToken } = await this.authService.login({
      id: req.user.id,
      email: req.user.email,
      system: system,
    });

    res.cookie('refreshToken', refreshToken, {
      httpOnly: true,
      sameSite: 'strict',
      maxAge: 7 * 24 * 60 * 60 * 1000,
    });

    return { token: accessToken };
  }

  @Get('refresh')
  @ApiOperation({ summary: 'Обновление access токена' })
  async refresh(@Request() req, @Res({ passthrough: true }) res: Response) {
    const refreshToken = req.cookies.refreshToken;

    const { accessToken, refreshToken: newRefreshToken } =
      await this.authService.refresh(refreshToken);

    res.cookie('refreshToken', newRefreshToken, {
      httpOnly: true,
      secure: process.env.NODE_ENV === 'production',
      sameSite: 'lax',
      maxAge: 7 * 24 * 60 * 60 * 1000,
      path: '/',
    });

    return { token: accessToken };
  }

  @UseGuards(JwtAuthGuard)
  @Post('logout')
  @ApiOperation({ summary: 'Выйти из аккаунта' })
  async logout(
    @Request() req,
    @Res({ passthrough: true }) res: Response,
  ) {
    const refreshToken = req.cookies.refreshToken;

    await this.authService.logoutThis(refreshToken)


    res.clearCookie('refreshToken', {
      httpOnly: true,
      secure: process.env.NODE_ENV === 'production',
      sameSite: 'lax',
      path: '/',
    });

    return "Пользователь вышел из аккаунта"
  }

  @ApiOperation({ summary: 'Проверка на запись токена' })
  @UseGuards(JwtAuthGuard)
  @Get('test')
  async test(@Request() req) {
    return req.user;
  }
}
