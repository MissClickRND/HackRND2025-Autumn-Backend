import { Controller, Get, UseGuards } from '@nestjs/common';
import { GuideService } from './guide.service';
import { ApiOperation } from '@nestjs/swagger';
import { JwtCookieAuthGuard } from 'src/jwt/jwt-auth.guard';

@Controller('guide')
export class GuideController {
  constructor(private readonly guideService: GuideService) {}

  @ApiOperation({ summary: 'Получить все справочники' })
  @UseGuards(JwtCookieAuthGuard)
  @Get()
  getAllReferences() {
    return this.guideService.getAllReferences();
  }
}
