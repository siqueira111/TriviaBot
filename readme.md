# Trivia Bot

## What is this project about?

This project is a **Trivia Bot** designed for use on Eric Parker's [Discord server](https://discord.gg/ericparker). this bot allows participants to answer questions and track scores in real-time.

## Dependencies

**This project depends on:**

- [node-js](https://nodejs.org/en)
- [npm](https://www.npmjs.com/)
- [bun](https://bun.sh/)
- [docker](https://www.docker.com/)
- [discord.js](https://discord.js.org/)
- [TypeORM](https://typeorm.io/)

**Current versions:**

```json
{
  "discord.js": "^14.18.0",
  "mysql2": "^3.14.0",
  "reflect-metadata": "^0.2.2",
  "typeorm": "^0.3.22"
}
```

## Setup

1. Install node js,
2. Install npm & bun
3. Go the the project directory
4. rename `.env.example` to `.env`
5. change the necessary settings

after that is done run:

_Linux:_

```bash
cd app/ && bun install
cd ../ && docker-compose build && docker-compose up -d
```

_Windows:_

```powershell
echo "Still under development"
```

## Commands

**Adming Commands**
These are the commands for the admin of the server, or whoever has access to manage this bot:

- `/add_question` Adds a question to the database
- `/create_event` Create an event
- `/start_trivia` Starts the trivia based on a given event
- `/flush` Deletes all the data related to an event
- `/drop` Deletes everything in the database
  You can find more about these commands on the [admin documentation](https://google.com)

**Player Commands**
There are the commands that the player has access to:

- `/leaderboard` Shows the leaderboard for the current event
- `/ping` Answers with 'Pong'
- `/play` Start playing the game
- `/stats` Shows the statistics player

You can find more about these commands on the [player documentation](https://google.com)

## Problems

you'll not have any problems _winky winky_
