/* eslint-disable @typescript-eslint/naming-convention */
import dotenv from 'dotenv';
import {
    cleanEnv,
    str
} from 'envalid';

dotenv.config( { path: '.env' } );

export const env = cleanEnv( process.env, {
    DATABASE_URL: str( { default: undefined } ),
    OPEN_AI_KEY: str()
} );