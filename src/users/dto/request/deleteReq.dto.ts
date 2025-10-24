import { ApiProperty } from "@nestjs/swagger"
import { IsString } from "class-validator"

export class deleteReqDTO{
    @ApiProperty()
    @IsString()
    userId: number
}