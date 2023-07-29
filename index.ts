import { ChatOpenAI } from 'langchain/chat_models/openai';
import { HumanMessage } from 'langchain/schema';
import { env } from './config';

const main = async () => {
    const chat = new ChatOpenAI( {
        temperature: 0,
        openAIApiKey: env.OPEN_AI_KEY
    } );

    const result = await chat.predictMessages(
        [ new HumanMessage( 'Translate this sentence from English to Vietnamese. I love programming.' ) ]
    );

    console.log( result );
};

main().then();