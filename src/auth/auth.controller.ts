import { Controller, Post } from '@nestjs/common';
import { ApiOperation } from '@nestjs/swagger';
import { AuthService } from './auth.service';
import { RegisterDtoRequest } from './dto/request/register.dto';

@Controller()
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @ApiOperation({ summary: 'Регистрация' })
  @Post()
  async Reg(dto: RegisterDtoRequest) {
    return 'Reg';
  }
}
