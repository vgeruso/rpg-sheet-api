import 'dotenv/config';
import * as process from 'process';
import { z } from 'zod';

const { NODE_ENV } = process.env;

export const isDevEnvironment = NODE_ENV === 'dev';
export const isTestEnvironment = NODE_ENV === 'test';
export const isProdEnvironment = NODE_ENV === 'production';

export const envSchema = z.object({
  NODE_ENV: z.enum(['dev', 'test', 'production']).default('dev'),
  DATABASE_URL: z.string().url(),
  PORT: z.coerce.number().default(3000),
  SERVICE_NAME: z.string().default('rpg-sheeet-api'),
  RESOURCE_NAME_MAIN: z.string().default('rpg-sheeet-api-dev-main'),
});
export type Env = z.infer<typeof envSchema>;

const _env = envSchema.safeParse(process.env);

if (!_env.success) {
  console.error('Invalid environment variables', _env.error.format());
  throw new Error('Invalid environment variables');
}

export const env = _env.data;
