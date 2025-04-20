FROM node:23-slim

# command: sh -c "npm run dev"

RUN npm install -g npm@latest

WORKDIR /app

COPY app/package*.json app/tsconfig.json ./

RUN npm install

RUN npm install --save-dev typescript nodemon @types/node ts-node

COPY app/ ./

EXPOSE 3000

CMD ["npx", "nodemon", "--watch", ".", "--exec", "ts-node", "index.ts"]
