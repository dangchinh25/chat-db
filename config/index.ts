/* eslint-disable @typescript-eslint/naming-convention */
import dotenv from 'dotenv';
import {
    cleanEnv,
    str
} from 'envalid';

dotenv.config( { path: '.env' } );

export const env = cleanEnv( process.env, {
    DATABASE_URL: str( { default: undefined } ),
    POSTGRES_USER: str(),
    POSTGRES_PASSWORD: str(),
    POSTGRES_HOST: str(),
    POSTGRES_PORT: str(),
    POSTGRES_DB: str(),
    OPEN_AI_KEY: str()
} );