export default class ApplicationException extends Error {
  code: string;
  statusCode: number;
  metadata: unknown;

  constructor(
    message: string,
    code: string,
    statusCode: number,
    metadata?: unknown,
  ) {
    super(message);

    Error.captureStackTrace(this, this.constructor);

    this.code = code;
    this.statusCode = statusCode;
    this.metadata = metadata;
  }

  toJson() {
    return {
      message: this.message,
      code: this.code,
      statusCode: this.statusCode,
      metadata: this.metadata,
      stack: this.stack,
    };
  }
}
