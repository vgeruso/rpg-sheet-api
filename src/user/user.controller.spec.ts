import { Test, TestingModule } from '@nestjs/testing';
import { UserController } from './user.controller';
import { UserService } from './user.service';
import { UserMock } from './user.mock';

describe('UserController', () => {
  let controller: UserController;

  const userMock: UserMock = new UserMock();

  beforeAll(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [UserController],
      providers: [{ provide: UserService, useValue: userMock.serviceMock }],
    }).compile();

    controller = module.get<UserController>(UserController);
  });

  beforeEach(() => {
    jest.resetAllMocks();
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
