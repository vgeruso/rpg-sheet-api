import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { SetupModule, SetupService } from '@app/setup';
import { UserModule } from './user/user.module';

@Module({
  imports: [SetupModule, UserModule],
  controllers: [AppController],
  providers: [AppService, SetupService],
})
export class AppModule {}
