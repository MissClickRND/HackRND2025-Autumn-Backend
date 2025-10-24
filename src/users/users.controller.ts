import { Body, Controller, ForbiddenException, Patch, Request, UseGuards } from '@nestjs/common';
import { UsersService } from './users.service';
import { ApiOperation } from '@nestjs/swagger';
import { verifyReqDTO } from './dto/request/verifyReq.dto';
import { JwtCookieAuthGuard } from 'src/jwt/jwt-auth.guard';

@Controller('users')
export class UsersController {
  constructor(private readonly userService: UsersService) {}

  @ApiOperation({ summary: 'Верификация' })
  @UseGuards(JwtCookieAuthGuard)
  @Patch('verify')
  async verify(@Request() req, @Body() dto: verifyReqDTO) {
    const user = req.user
    if (user.role == "Admin") {
        const newRole = await this.userService.update(dto)
        return {message: "Роль успешно обновлена", newRole}
    }
    else {
        throw new ForbiddenException("Недостаточно прав")
    }
  }

@ApiOperation({ summary: 'Верификация' })
  @UseGuards(JwtCookieAuthGuard)
  @Patch('verify')
  async delete(@Request() req, @Body() dto: verifyReqDTO) {
    const user = req.user
    if (user.role == "Admin") {
        const newRole = await this.userService.update(dto)
        return {message: "Роль успешно обновлена", newRole}
    }
    else {
        throw new ForbiddenException("Недостаточно прав")
    }
  }
}
