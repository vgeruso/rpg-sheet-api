import { LoggerService } from '@nestjs/common';
import { env } from '../../env';
import { WinstonModule } from 'nest-winston';
import { createLogger, format, transports } from 'winston';

export class LoggerUtil {
  public static getWrappedLoggerInstance(
    serviceName: string,
    resourceName: string,
  ): LoggerService {
    const logger = createLogger({
      format: format.combine(format.errors({ stack: true }), format.json()),
      transports: [],
      defaultMeta: {
        env: env.NODE_ENV,
        service: serviceName,
        resource: resourceName,
      },
    });

    logger.add(new transports.Console());

    return WinstonModule.createLogger(logger);
  }
}
