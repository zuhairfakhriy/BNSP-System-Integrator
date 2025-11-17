# build stage (optional)
FROM node:18-alpine AS builder
WORKDIR /app
COPY app/package*.json ./
RUN npm install
COPY app/ .
RUN npm run build || true

# runtime
FROM node:18-alpine
WORKDIR /app
COPY --from=builder /app .
EXPOSE 8080
CMD ["node","server.js"]

