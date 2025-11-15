import { SwaggerModule, DocumentBuilder } from '@nestjs/swagger';
import { INestApplication } from '@nestjs/common';
import { Env, isDevEnvironment, isTestEnvironment } from './env';
import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { HttpExceptionFilter } from '@shared/exceptions/filter/http.exception-filter';
import { ValidationPipe } from '@shared/pipes/validation.pipe';
import { ConfigService } from '@nestjs/config';

async function bootstrap() {
  const app: INestApplication = await NestFactory.create(AppModule);

  app.useGlobalFilters(new HttpExceptionFilter());
  app.useGlobalPipes(ValidationPipe);

  app.enableCors();

  if (isDevEnvironment || isTestEnvironment) {
    const config = new DocumentBuilder()
      .setDescription('Documentation of endpoints system.')
      .setTitle('RPG Sheet CORE API')
      .setVersion('1.0.0')
      .addBearerAuth()
      .build();

    const document = SwaggerModule.createDocument(app, config);

    SwaggerModule.setup('api', app, document);
  }

  const configService = app.get<ConfigService<Env, true>>(ConfigService);
  const port = configService.get('PORT', { infer: true });
  await app.listen(port);
}

bootstrap();
