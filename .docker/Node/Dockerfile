# Installing bun
FROM oven/bun:1 AS base
FROM base AS install

# Installs deps
WORKDIR /app
COPY app/ ./
RUN bun install --frozen-lockfile


ENTRYPOINT ["bun", "--watch", "."]
