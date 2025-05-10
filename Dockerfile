# Stage 1: Build
FROM node:18-alpine AS builder

WORKDIR /app

RUN apk add --no-cache openssl python3 make g++

COPY package.json yarn.lock ./
COPY prisma ./prisma/

RUN yarn install --frozen-lockfile

COPY . .

RUN yarn build


# Stage 2: Run
FROM node:18-alpine

WORKDIR /app

RUN apk add --no-cache openssl

COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package.json /app/yarn.lock ./
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/prisma ./prisma

RUN mkdir -p /app/uploads

EXPOSE 4000

CMD ["sh", "-c", "npx prisma generate && npx prisma migrate deploy && node dist/main"]
