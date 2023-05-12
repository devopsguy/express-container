FROM node:alpine AS builder

EXPOSE 3000

WORKDIR /usr/src/app

ADD package*.json ./

RUN npm ci --omit=dev && rm package*.json

COPY . .

CMD [ "node", "app.js" ]