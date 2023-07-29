/* eslint-disable @typescript-eslint/naming-convention */
'use client';
import axios from 'axios';
import React, { useState } from 'react';

interface HttpResponse {
  data: any;
  error?: string;
}

const Home: React.FC = ()=> {
    const [ inputValue, setInputValue ] = useState( '' );
    const [ response, setResponse ] = useState<HttpResponse | null>( null );

    const handleInputChange = ( event: React.ChangeEvent<HTMLInputElement> ) => {
        setInputValue( event.target.value );
    };

    const handleFormSubmit = async ( event: React.FormEvent<HTMLFormElement> ) => {
        event.preventDefault();

        try {
            const response = await axios.post( 'http://localhost:4000/instructions', { instructions: inputValue } );
            setResponse( { data: response.data.output } );
        } catch ( error ) {
            setResponse( { error: 'An error occurred while making the request.', data: error } );
        }
    };

    return (
        <div
            style={{
                margin: '20px auto', // Adds spacing on the top and bottom, and centers the container horizontally
                maxWidth: '600px' // Limits the width of the container
            }}
        >
            <div
                style={{
                    padding: '20px', // Adds some internal spacing for the container's content
                    border: '1px solid #ccc', // Optional border for visual separation
                    borderRadius: '8px' // Optional border radius for rounded corners
                }}
            >
                <form onSubmit={handleFormSubmit}>
                    <div style={{ display: 'flex', justifyContent: 'center', alignItems: 'center' }}>
                        <label style={{ marginRight: '10px' }}>
                            Input:
                            <input
                                type="text"
                                value={inputValue}
                                onChange={handleInputChange}
                            />
                        </label>
                        <button type="submit">Submit</button>
                    </div>
                </form>
                <div style={{ marginTop: '20px', width: '100%', textAlign: 'center' }}>
                    <textarea
                        readOnly
                        value={
                            response
                                ? response.error
                                    ? `Error: ${ response.error }`
                                    : JSON.stringify( response.data, null, 2 )
                                : ''
                        }
                        rows={6}
                        cols={40}
                        style={{
                            width: '100%', // Make the textarea fill the container's width
                            padding: '10px',
                            boxSizing: 'border-box' // Include padding in the width calculation
                        }}
                    />
                </div>
            </div>
        </div>
    );
};

export default Home;