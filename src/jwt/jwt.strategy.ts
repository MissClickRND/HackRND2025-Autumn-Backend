// jwt.strategy.ts
import { Injectable, UnauthorizedException } from '@nestjs/common';
import { Strategy, ExtractJwt, StrategyOptions } from 'passport-jwt';
import { PassportStrategy } from '@nestjs/passport';
import { Request } from 'express';
import { UsersService } from 'src/users/users.service';

@Injectable()
export class JwtStrategy extends PassportStrategy(Strategy) {
  constructor(private readonly usersService: UsersService) {
    super({
      jwtFromRequest: ExtractJwt.fromExtractors([
        (request: Request) => {
          return request.cookies?.accessToken;
        },
      ]),
      ignoreExpiration: false,
      secretOrKey: process.env.JWT_SECRET,
      passReqToCallback: true,
    } as StrategyOptions);
  }

  async validate(req: Request, payload: any) {
    if (!payload?.sub) {
      throw new UnauthorizedException();
    }

    const user = await this.usersService.GetById(payload.sub);
    if (!user) {
      throw new UnauthorizedException();
    }

    return user;
  }
}
