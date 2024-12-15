import { SetupService } from '@app/setup';
import { PackageObject } from '@app/setup/types/packageObject.type';
import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  constructor(private setupService: SetupService) {}

  async getHello(): Promise<PackageObject> {
    await this.setupService.initSetup();
    return this.setupService.getSetup();
  }
}
