FROM node:alpine AS builder

EXPOSE 3000

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm ci --omit=dev

COPY . .

CMD [ "node", "app.js" ]