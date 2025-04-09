import { ApiProperty } from '@nestjs/swagger';
import { IsEmail, IsNotEmpty, IsString } from 'class-validator';

export class CreateUserDto {
  @ApiProperty({ example: 'John Doe' })
  @IsNotEmpty()
  @IsString()
  name: string;

  @ApiProperty({ example: 'john.doe@email.com' })
  @IsString()
  @IsEmail()
  @IsNotEmpty()
  email: string;

  @ApiProperty({ example: 'john.doe' })
  @IsNotEmpty()
  @IsString()
  username: string;

  @ApiProperty({ example: 'john.doe' })
  @IsNotEmpty()
  @IsString()
  password: string;
}
