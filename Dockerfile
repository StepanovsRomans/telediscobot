FROM node:22-alpine AS builder

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm ci

COPY . .

FROM node:22-alpine

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app ./
RUN npm ci --only=production

CMD ["node", "index.js"]