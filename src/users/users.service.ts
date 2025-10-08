import {
  ConflictException,
  Injectable,
  UnauthorizedException,
} from '@nestjs/common';
import { RegisterDtoRequest } from 'src/auth/dto/request/register.dto';
import { checkEmailReqDTO } from './dto/request/checkEmailReq.dto';
import { PrismaService } from 'src/prisma/prisma.service';
import * as bcrypt from 'bcrypt';

@Injectable()
export class UsersService {
  constructor(private readonly prismaService: PrismaService) {}

  private async hashpassword(password: string) {
    return await bcrypt.hash(password, 10);
  }

  async GetByEmail(email: checkEmailReqDTO) {
    const user = await this.prismaService.user.findUnique({
      where: { email: email.email },
    });
    return user;
  }

  async checkEmail(email: checkEmailReqDTO) {
    const user = await this.prismaService.user.findUnique({
      where: { email: email.email },
    });
    if (user) {
      throw new ConflictException('Email уже используется');
    }
  }

  async login(dto: RegisterDtoRequest) {
    const user = await this.GetByEmail({ email: dto.email });
    if (!user) {
      throw new ConflictException('Пользователь не найден');
    }

    const pass = await this.hashpassword(dto.password);

    if (pass != user.password) {
      throw new UnauthorizedException('Неверный email или пароль');
    }

    return { id: user.id, email: user.id };
  }

  async create(dto: RegisterDtoRequest) {
    await this.checkEmail({ email: dto.email });

    const hashpass = await this.hashpassword(dto.password);

    return await this.prismaService.user.create({
      data: { email: dto.email, password: hashpass },
    });
  }
}
