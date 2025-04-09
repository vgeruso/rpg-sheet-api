import { faker } from '@faker-js/faker/.';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';

export class UserMock {
  private id: string;
  private name: string;
  private email: string;
  private username: string;
  private password: string;

  private prisma: any;
  private service: any;

  constructor() {
    const { firstName, lastName } = this.generateNameData();

    this.id = faker.string.uuid();
    this.name = `${firstName} ${lastName}`;
    this.username = faker.internet.username({
      firstName,
      lastName,
    });
    this.email = faker.internet.email({
      firstName,
      lastName,
    });
    this.password = faker.internet.password();

    this.prisma = {
      user: {
        findUnique: jest.fn(),
        create: jest.fn(),
        update: jest.fn(),
        delete: jest.fn(),
        findMany: jest.fn(),
        findFirst: jest.fn(),
      },
    };

    this.service = {
      findOne: jest.fn(),
      create: jest.fn(),
      update: jest.fn(),
      delete: jest.fn(),
      findAll: jest.fn(),
    };
  }

  get validId() {
    return this.id;
  }

  get invalidId() {
    return faker.string.uuid();
  }

  get validCreateData(): CreateUserDto {
    return {
      name: this.name,
      email: this.email,
      password: this.password,
      username: this.username,
    };
  }

  get invalidCreateData(): any {
    return {
      name: this.name,
      password: this.password,
      username: this.username,
    };
  }

  get validUpdateData(): UpdateUserDto {
    return {
      email: faker.internet.email(this.generateNameData()),
    };
  }

  get prismaMock() {
    return this.prisma;
  }

  get serviceMock() {
    return this.service;
  }

  private generateNameData() {
    const firstName: string = faker.person.firstName();
    const lastName: string = faker.person.lastName();

    return {
      firstName,
      lastName,
    };
  }
}
