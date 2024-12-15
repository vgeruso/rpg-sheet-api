import { Controller, Get } from '@nestjs/common';
import { AppService } from './app.service';
import { PackageObject } from '@app/setup/types/packageObject.type';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get()
  async getHello(): Promise<PackageObject> {
    return await this.appService.getHello();
  }
}
