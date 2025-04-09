import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { SetupService } from '@app/setup';
import { NestExpressApplication } from '@nestjs/platform-express';
import { SwaggerModule, DocumentBuilder } from '@nestjs/swagger';
import { BadRequestException, ValidationPipe } from '@nestjs/common';

async function bootstrap() {
  const app = await NestFactory.create<NestExpressApplication>(AppModule, {
    cors: true,
  });

  app.useGlobalPipes(
    new ValidationPipe({
      exceptionFactory: (errors) => {
        const result = errors.map((error) => ({
          property: error.property,
          message: error.constraints[Object.keys(error.constraints)[0]],
        }));
        return new BadRequestException(result);
      },
      stopAtFirstError: true,
    }),
  );

  const config = new DocumentBuilder()
    .setDescription(
      'Documentação voltada ao conhecimento e teste das rotas dos módulos disponíveis no sistema.',
    )
    .setTitle('RPG Sheet CORE API')
    .setVersion((await new SetupService().getSetup()).version)
    .addBearerAuth()
    .build();

  const document = SwaggerModule.createDocument(app, config);

  SwaggerModule.setup('swagger', app, document);

  await app.listen(3000);
}

bootstrap();
