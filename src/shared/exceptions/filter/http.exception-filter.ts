import {
  ArgumentsHost,
  Catch,
  ExceptionFilter,
  HttpException,
  Logger,
} from '@nestjs/common';
import ApplicationException from '../application.exception';
import { Request, Response } from 'express';

@Catch(ApplicationException, HttpException)
export class HttpExceptionFilter implements ExceptionFilter {
  catch(exception: ApplicationException | HttpException, host: ArgumentsHost) {
    const ctx = host.switchToHttp();
    const response = ctx.getResponse<Response>();
    const request = ctx.getRequest<Request>();

    Logger.error(JSON.stringify(exception), 'HttpExceptionFilter');

    if (exception instanceof ApplicationException) {
      return response.status(exception.statusCode).json({
        message: exception.message,
        code: exception.code,
        metadata: exception.metadata,
        patch: request.url,
      });
    }

    return response.status(500).json({
      message: 'Unknown server error',
      statusCode: 'unknown_server_error',
      path: request.url,
    });
  }
}
