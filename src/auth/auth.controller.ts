import {
  Body,
  Controller,
  Post,
  Request,
  Res,
  UseGuards,
} from '@nestjs/common';
import { ApiOperation } from '@nestjs/swagger';
import { AuthService } from './auth.service';
import { RegisterDtoRequest } from './dto/request/register.dto';
import { AuthGuard } from '@nestjs/passport';
import type { Response } from 'express';

@Controller()
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @ApiOperation({ summary: 'Регистрация' })
  @Post('register')
  async Reg(@Body() dto: RegisterDtoRequest) {
    return this.authService.register(dto);
  }

  @UseGuards(AuthGuard('local'))
  @Post('login')
  async Auth(@Request() req, @Res({passthrough: true}) res: Response) {

    const { accessToken, refreshToken } = await this.authService.login(req.user);

      res.cookie('refreshToken', refreshToken, {
      httpOnly: true,
      sameSite: 'strict',
      maxAge: 7 * 24 * 60 * 60 * 1000,
    });

    return {token: accessToken}
  }
}
