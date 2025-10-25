import { ApiProperty } from "@nestjs/swagger"
import { $Enums } from "@prisma/client"
import { IsNumber, IsString } from "class-validator"

export class verifyReqDTO{
    @ApiProperty()
    @IsNumber()
    userId: number

    @ApiProperty()
    @IsString()
    role: $Enums.Role
}