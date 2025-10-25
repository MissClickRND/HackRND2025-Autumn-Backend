import { Body, Controller, Get, UseGuards } from '@nestjs/common';
import { ProjectService } from './projects.service';
import { GetByIdDTO } from './dto/getById.dto';
import { ApiOperation } from '@nestjs/swagger';
import { JwtCookieAuthGuard } from 'src/jwt/jwt-auth.guard';

@Controller('project')
export class ProjectController {
  constructor(
    private readonly projectService: ProjectService,
  ) {}

  @ApiOperation({ summary: 'Получить все проекты' })
  @UseGuards(JwtCookieAuthGuard)
  @Get('getAll')
  async getAll() {
    return await this.projectService.getAllForTable();
  }

  @ApiOperation({ summary: 'Подробно о профиле' })
  @UseGuards(JwtCookieAuthGuard)
  @Get()
  async getOneById(@Body() dto: GetByIdDTO) {
    return await this.projectService.getById(dto.projectId);
  }
}
