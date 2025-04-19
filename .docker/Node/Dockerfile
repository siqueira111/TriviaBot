FROM node:23-slim

# command: sh -c "npm run dev"

RUN npm install -g npm@latest

WORKDIR /app

COPY app/package*.json app/tsconfig.json ./

RUN npm install

#RUN npm install --save-dev typescript ts-node@latest @types/node
RUN npm install --save-dev typescript nodemon @types/node

COPY app/ ./

EXPOSE 3000

# CMD ["npx", "ts-node", "index.ts"]
CMD ["npx", "nodemon", "--watch", ".", "--exec", "npx ts-node", "index.ts"]