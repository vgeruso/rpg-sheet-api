import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { SetupModule, SetupService } from '@app/setup';

@Module({
  imports: [SetupModule],
  controllers: [AppController],
  providers: [AppService, SetupService],
})
export class AppModule {}
