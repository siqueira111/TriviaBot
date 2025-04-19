FROM node:23-slim

# command: sh -c "npm run dev"

RUN npm install -g npm@latest

WORKDIR /app

COPY app/package*.json app/tsconfig.json ./

RUN npm install

RUN npm install --save-dev typescript ts-node @types/node

COPY app/ .

CMD ["npx", "ts-node", "index.ts"]