import { env } from './config';
import { OpenAI } from 'langchain/llms/openai';
import { SqlDatabase } from 'langchain/sql_db';
import { createSqlAgent, SqlToolkit } from 'langchain/agents/toolkits/sql';
import { DataSource } from 'typeorm';
import express from 'express';
import cors from 'cors';

export const app = express();
app.use( express.json() );
app.use( cors() );

app.post( '/instructions', async ( req, res ) => {
    const { instructions } = req.body;

    const appDataSource = new DataSource( {
        type: 'postgres',
        host: env.POSTGRES_HOST,
        port: Number( env.POSTGRES_PORT ),
        username: env.POSTGRES_USER,
        password: env.POSTGRES_PASSWORD,
        database: env.POSTGRES_DB,
        synchronize: true,
        entities: [],
        migrations: [],
        subscribers: []
    } );

    const db = await SqlDatabase.fromDataSourceParams(
        { appDataSource: appDataSource }
    );

    const model = new OpenAI( {
        openAIApiKey: env.OPEN_AI_KEY,
        temperature: 0
    } );

    const toolkit = new SqlToolkit( db, model );
    const executor = createSqlAgent( model, toolkit );

    console.log( `Executing with input "${ instructions }"...` );

    const result = await executor.call( { input: instructions } );

    console.log( `Got output ${ result.output }` );

    console.log(
        `Got intermediate steps ${ JSON.stringify(
            result.intermediateSteps,
            null,
            2
        ) }`
    );

    return res.status( 200 ).json( { output: result.output } );
} );

app.listen( env.PORT, () => {
    console.log( `Server running on port ${ env.PORT }` );
} );
