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
    return await this.prismaService.user.delete({where: {id: dto.userId}})
  }

  // async update(dto: )

  async logout() {}
}
