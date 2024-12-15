import { Injectable } from '@nestjs/common';
import { PackageObject } from './types/packageObject.type';
import * as fs from 'fs/promises';

@Injectable()
export class SetupService {
  private project: string;
  private version: string;
  private author: string;

  getSetup(): PackageObject {
    return {
      project: this.project,
      author: this.author,
      version: this.version,
    };
  }

  async initSetup(): Promise<void> {
    const packageJson: string = await fs.readFile('./package.json', 'utf8');
    const objectConversion: any = await JSON.parse(packageJson);

    this.project = objectConversion.name;
    this.author = objectConversion.author;
    this.version = objectConversion.version;
  }
}
