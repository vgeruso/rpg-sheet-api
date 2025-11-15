import { ContextService } from '@shared/services/context.service';

import {
  CallHandler,
  ExecutionContext,
  Injectable,
  Logger,
  NestInterceptor,
} from '@nestjs/common';

import { Observable } from 'rxjs';

@Injectable()
export class LoggingInterceptor implements NestInterceptor {
  private readonly logger = new Logger(LoggingInterceptor.name);

  intercept<T>(
    _context: ExecutionContext,
    next: CallHandler<T>,
  ): Observable<T> {
    try {
      const request = ContextService.getCurrentRequest();
      ContextService.setInitialRequestData();

      const urlRequested = request?.url;
      if (urlRequested?.includes('health')) {
        return next.handle();
      }

      this.logger.log(`[${request?.method}] ${urlRequested}`, {
        body: request?.body,
        headers: request?.headers,
      });
    } catch (error) {
      this.logger.error('LoggingInterceptor.intercept() error', error);
    }

    return next.handle();
  }
}
