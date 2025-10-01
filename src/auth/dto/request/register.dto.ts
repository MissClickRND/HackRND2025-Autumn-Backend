import { ApiProperty } from "@nestjs/swagger";
import { IsString, MinLength } from "class-validator";

export class RegisteDtoRequest{

    @ApiProperty()
    @MinLength(3)
    @IsString()
    login: string;

    @ApiProperty()
    @MinLength(8)
    @IsString()
    password: string;
}