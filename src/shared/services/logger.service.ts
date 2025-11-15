import { ContextService } from '@shared/services/context.service';
import { LoggerService as NestLoggerService } from '@nestjs/common';

export class LoggerService implements NestLoggerService {
  private logger: NestLoggerService;

  constructor(wrappedLogger: NestLoggerService) {
    this.logger = wrappedLogger;
  }

  log(message: unknown, data?: unknown) {
    this.logger.log(message, data);
  }

  error(error: unknown, stack?: unknown, data?: unknown) {
    this.logger.error(error, stack, ContextService.setMetadataContext(data));
  }

  warn(message: unknown, data: unknown) {
    this.logger.warn(message, ContextService.setMetadataContext(data));
  }

  debug?(message: unknown, data: unknown) {
    if (this.logger.debug) {
      this.logger.debug(message, ContextService.setMetadataContext(data));
    }
  }

  verbose?(message: unknown, data?: unknown) {
    if (this.logger.verbose) {
      this.logger.verbose(message, ContextService.setMetadataContext(data));
    }
  }
}
