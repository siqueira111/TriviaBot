# What is this project about?

This project is a **Trivia Bot** designed for use on Eric Parker's [Discord server](https://discord.gg/ericparker). this bot allows participants to answer questions and track scores in real-time.

<br>

# Dependencies

This project depends on:

* [docker](https://www.docker.com/)
* [discord.js](https://discord.js.org/)
* [dotenv](https://github.com/motdotla/dotenv)
* [mysql2](https://github.com/sidorares/node-mysql2)
* [node-cron](https://github.com/node-cron/node-cron)

<br>

**Current versions:**

```json
{
  "discord.js": "^14.18.0",
  "dotenv": "^16.5.0",
  "mariadb": "^3.4.1",
  "mysql2": "^3.0.0",
  "node-cron": "^3.0.3"
}
```

<br>

# Setup

1. rename `.env.example` to `.env`
2. change the necessary settings

after that is done run:

```bash
npm install
docker-compose build && docker-compose up -d
```

<br>

# Problems

you'll not have any problems _winky winky_
