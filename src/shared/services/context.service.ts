import { randomUUID } from 'crypto';
import { RequestContext } from 'nestjs-request-context';

export class ContextService {
  static hasCurrentContextLoaded(): boolean {
    return !!RequestContext.currentContext;
  }

  static getCurrentRequest() {
    return RequestContext.currentContext.req;
  }

  static setInitialRequestData() {
    this.setRequestId(randomUUID());
  }

  static setRequestId(id: string) {
    this.getCurrentRequest().requestId = id;
  }

  static getRequestId() {
    if (ContextService.hasCurrentContextLoaded()) {
      return this.getCurrentRequest()?.requestId || '';
    }
    return '';
  }

  static setMetadataContext(data: unknown) {
    try {
      return {
        requestId: ContextService.getRequestId(),
        data,
      };
    } catch (e) {
      return {
        error: e,
        data,
      };
    }
  }
}
