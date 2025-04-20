FROM node:23-slim

# command: sh -c "npm run dev"

RUN npm install -g npm@latest

WORKDIR /app

COPY app/ ./

RUN npm install

CMD ["npx", "nodemon", "--watch", ".", "--exec", "npx", "ts-node", "index.ts"]
