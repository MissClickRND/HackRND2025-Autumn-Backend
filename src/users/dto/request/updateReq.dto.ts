import { ApiProperty } from '@nestjs/swagger';
import { $Enums } from '@prisma/client';
import { IsEmail, IsOptional, IsString } from 'class-validator';

export class updateReqDTO {
  @ApiProperty()
  @IsString()
  userId: number;

  @ApiProperty()
  @IsEmail()
  @IsOptional()
  email?: string;

  @ApiProperty()
  @IsString()
  @IsOptional()
  password?: string;

  @ApiProperty()
  @IsString()
  @IsOptional()
  name?: string;

  @ApiProperty()
  @IsString()
  @IsOptional()
  role?: $Enums.Role;
}
