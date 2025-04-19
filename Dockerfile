FROM node:lts-alpine

WORKDIR /app

COPY package.json package-lock.json /app/
RUN npm ci --production

COPY . /app/

# Set the binary targets for Prisma generation
ENV PRISMA_GENERATE_BINARY_TARGETS=linux-musl-openssl-3.0.x

HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 CMD node -e "require('net').connect(443, 'discord.com').end() || process.exit(1)"

CMD ["sh", "-c", "npm run deploy && npm run dev"]