import ApplicationException from './application.exception';

export default class ValidationException extends ApplicationException {
  constructor(errors: unknown) {
    super('validation error', 'validation_error', 400, errors);
  }
}
