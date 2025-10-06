import { Controller, Post } from "@nestjs/common";
import { AuthService } from "auth/auth.service";
import { ApiOperation } from "@nestjs/swagger";

@Controller()
export class AuthController{
    constructor(private readonly authService: AuthService) {}

    @ApiOperation({summary: "Регистрация"})
    @Post()
    async Reg() {
        return "Reg"
        
    }
}