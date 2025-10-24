import { $Enums } from "@prisma/client"

export class LoginReqDTO{
    id: number
    email: string
    system: $Enums.System
}