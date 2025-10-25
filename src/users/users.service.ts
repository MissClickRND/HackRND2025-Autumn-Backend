import {
  ConflictException,
  Injectable,
  NotFoundException,
  UnauthorizedException,
} from '@nestjs/common';
import { RegisterDtoRequest } from 'src/auth/dto/request/register.dto';
import { checkEmailReqDTO } from './dto/request/checkEmailReq.dto';
import { PrismaService } from 'src/prisma/prisma.service';
import * as bcrypt from 'bcrypt';
import { ValidUserDTO } from 'src/auth/dto/request/Validuser.dto';
import { verifyReqDTO } from './dto/request/verifyReq.dto';
import { deleteReqDTO } from './dto/request/deleteReq.dto';
import { updateReqDTO } from './dto/request/updateReq.dto';

@Injectable()
export class UsersService {
  constructor(private readonly prismaService: PrismaService) {}

  private async hashpassword(password: string) {
    return await bcrypt.hash(password, 10);
  }

  private async GetByEmail(email: checkEmailReqDTO) {
    return await this.prismaService.user.findUnique({
      where: { email: email.email },
    });
  }

  async GetById(id: number) {
    const user = await this.prismaService.user.findUnique({
      where: { id: id },
    });
    if (!user) {
      throw new NotFoundException('Пользователь не найден');
    }
    const { password, ...result } = user;
    return result;
  }

  async validateUser(dto: ValidUserDTO) {
    const user = await this.GetByEmail({ email: dto.email });
    if (!user) {
      throw new NotFoundException('Пользователь не найден');
    }
    const IsPassValid = await bcrypt.compare(dto.password, user.password);
    if (!IsPassValid) {
      throw new UnauthorizedException('Неверный email или пароль');
    }
    const { password, ...result } = user;
    return result;
  }

  async create(dto: RegisterDtoRequest) {
    const valid = await this.GetByEmail({ email: dto.email });
    if (valid) {
      throw new ConflictException('Пользователь с таким email уже существует');
    }

    const hashpass = await this.hashpassword(dto.password);

    const user = await this.prismaService.user.create({
      data: { email: dto.email, password: hashpass, name: dto.name },
    });

    return { id: user.id, email: dto.email, name: dto.name };
  }

  async updateRole(dto: verifyReqDTO) {
    return await this.prismaService.user.update({
      where: { id: dto.userId },
      data: { role: dto.role },
    });
  }

  async delete(dto: deleteReqDTO) {
    await this.prismaService.refreshToken.deleteMany({
      where: { userId: dto.userId },
    });
    return await this.prismaService.user.delete({ where: { id: dto.userId } });
  }

  async getAll() {
    return await this.prismaService.user.findMany({
      select: { id: true, email: true, name: true, role: true },
    });
  }

  async getAllVerify() {
    return await this.prismaService.user.findMany({
      where: { role: 'NotVerify' },
      select: { id: true, email: true, name: true, role: true },
    });
  }

async update(dto: updateReqDTO) {
  const { userId, password, ...updateFields } = dto;

  const updateData: any = {};
  for (const [key, value] of Object.entries(updateFields)) {
    if (value !== undefined) {
      updateData[key] = value;
    }
  }

  if (password !== undefined) {
    updateData.password = await this.hashpassword(password);
  }

  return await this.prismaService.user.update({
    where: { id: userId },
    data: updateData,
  });
}

async getCount() {
  const counts = await this.prismaService.user.groupBy({
    by: ['role'],
    _count: { _all: true },
  });

  const roleColors: Record<string, string> = {
    Admin: '#7700FF',
    Analyst: '#749FD6',
    User: '#CBCBCB',
    NotVerify: '#FF4F12',
  };

  const roles = ['Admin', 'Analyst', 'User', 'NotVerify'] as const;

  const result = roles.map((role) => {
    const found = counts.find((item) => item.role === role);
    return {
      name: role,
      value: found ? found._count._all : 0,
      color: roleColors[role],
    };
  });

  return result;
}
}
