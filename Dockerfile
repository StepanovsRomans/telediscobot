FROM --platform=linux/amd64 node:22-alpine AS builder

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm ci

COPY . .

FROM --platform=linux/amd64 node:22-alpine

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app ./
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
RUN npm ci --only=production

CMD ["node", "index.js"]