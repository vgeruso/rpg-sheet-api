import { ValidationPipe as NestValidadionPipe } from '@nestjs/common';
import ValidationException from '../exceptions/validation.exception';

export const ValidationPipe = new NestValidadionPipe({
  exceptionFactory(errors) {
    const metadata = errors
      .map((error) => ({
        property: error.property,
        constraints: error.constraints,
      }))
      .flat();

    throw new ValidationException(metadata);
  },
});
