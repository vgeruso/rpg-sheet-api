import { SetupService } from '@app/setup';
import { PackageObject } from '@app/setup/types/packageObject.type';
import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  constructor(private setupService: SetupService) {}

  getHello(): PackageObject {
    return this.setupService.getSetup();
  }
}
