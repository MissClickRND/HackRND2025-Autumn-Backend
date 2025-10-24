import { ApiProperty } from "@nestjs/swagger"
import { $Enums } from "@prisma/client"
import { IsString } from "class-validator"

export class verifyReqDTO{
    @ApiProperty()
    @IsString()
    userId: number

    @ApiProperty()
    @IsString()
    role: $Enums.Role
}