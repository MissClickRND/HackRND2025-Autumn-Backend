import { $Enums } from "@prisma/client"

export class LoginResDTO{
    id: number
    email: string
    system: $Enums.System
}