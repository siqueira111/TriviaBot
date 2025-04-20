# What is this project about?

This project is a **Trivia Bot** designed for use on Eric Parker's [Discord server](https://discord.gg/ericparker). this bot allows participants to answer questions and track scores in real-time.

<br>

# Dependencies

This project depends on:

- [docker](https://www.docker.com/)
- [discord.js](https://discord.js.org/)
- [TypeORM](https://typeorm.io/)

<br>

**Current versions:**

```json
{
  "discord.js": "^14.18.0",
  "mysql2": "^3.14.0",
  "reflect-metadata": "^0.2.2",
  "typeorm": "^0.3.22"
}
```

<br>

# Setup

1. rename `.env.example` to `.env`
2. change the necessary settings

after that is done run:

```bash
bun install
docker-compose build && docker-compose up -d
```

<br>

# Problems

you'll not have any problems _winky winky_
