FROM node:23-slim

# command: sh -c "npm run dev"

RUN npm install -g npm@latest

WORKDIR /app

COPY app/package*.json app/tsconfig.json ./

RUN npm install

COPY app/ ./

CMD ["npx", "nodemon", "--watch", ".", "--exec", "npx", "ts-node", "index.ts"]
