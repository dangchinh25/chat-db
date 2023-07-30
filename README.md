# Chat SQL Database
- This is a demo for integrating OpenAI and PostgreSQL database. User can query and interfact with database in natural language without any writing any SQL code. The application exposes a NextJs client communicating to an Express backend that uses Langchain for OpenAI integration.

## Prerequisites
- Docker ([Installation guide](https://docs.docker.com/get-started/))

## Installation
1. Setup environment variables.
   Create environment config file and change environment variable with the correct variables.
```sh
cp .env.example .env
```
2. Install dependencies (Make sure to use Node with version >= 18.0.0)
```sh
npm install
cd ai-db-client
npm install
```

## Running Locally (via Docker Compose)

### Create Temporary Database
```sh
npm run temp-database-up
```
- After successfully spinning up the database, use the `db/historical_migrations/init.sql` file to populate the database.
### Run server (The server will be running on default port of 4000)
```sh
npm run dev
```
### Run client (The client will be running on default port of 3000)
```sh
cd ai-db-client
npm run dev
```
### Drop Temporary Database
```
npm run temp-database-down
```