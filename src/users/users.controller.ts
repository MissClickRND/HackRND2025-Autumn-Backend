import {
  Body,
  Controller,
  Delete,
  ForbiddenException,
  Get,
  Patch,
  Request,
  UseGuards,
} from '@nestjs/common';
import { UsersService } from './users.service';
import { ApiOperation } from '@nestjs/swagger';
import { verifyReqDTO } from './dto/request/verifyReq.dto';
import { JwtCookieAuthGuard } from 'src/jwt/jwt-auth.guard';
import { deleteReqDTO } from './dto/request/deleteReq.dto';
import { updateReqDTO } from './dto/request/updateReq.dto';

@Controller('users')
export class UsersController {
  constructor(private readonly userService: UsersService) {}

  @ApiOperation({ summary: 'Верификация' })
  @UseGuards(JwtCookieAuthGuard)
  @Patch('verify')
  async verify(@Request() req, @Body() dto: verifyReqDTO) {
    const user = req.user;
    if (user.role == 'Admin') {
      const newRole = await this.userService.updateRole(dto);
      return { message: 'Роль успешно обновлена', newRole };
    } else {
      throw new ForbiddenException('Недостаточно прав');
    }
  }

  @ApiOperation({ summary: 'Удаление' })
  @UseGuards(JwtCookieAuthGuard)
  @Delete('delete')
  async delete(@Request() req, @Body() dto: deleteReqDTO) {
    const user = req.user;
    if (user.role == 'Admin') {
      await this.userService.delete(dto);
      return { message: 'Пользоватеь успешно удален' };
    } else {
      throw new ForbiddenException('Недостаточно прав');
    }
  }

  @ApiOperation({ summary: 'Получить всех' })
  @UseGuards(JwtCookieAuthGuard)
  @Get('all')
  async getAll() {
    return await this.userService.getAll();
  }

  @ApiOperation({ summary: 'Получить текущего' })
  @UseGuards(JwtCookieAuthGuard)
  @Get('')
  async getUser(@Request() req) {
    return await this.userService.GetById(req.user.id);
  }

  @ApiOperation({ summary: 'Получить всех невер' })
  @UseGuards(JwtCookieAuthGuard)
  @Get('allVerify')
  async getVerifyUser() {
    return await this.userService.getAllVerify();
  }

  @ApiOperation({ summary: 'Обновить пользователя' })
  @UseGuards(JwtCookieAuthGuard)
  @Patch('update')
  async updateUser(@Request() req, dto: updateReqDTO) {
    const user = req.user;
    if (user.role == 'Admin') {
      await this.userService.update(dto);
      return { message: 'Пользоватеь успешно удален' };
    } else {
      throw new ForbiddenException('Недостаточно прав');
    }
  }
}
