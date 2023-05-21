FROM node:alpine AS builder

LABEL org.opencontainers.image.authors="octavian@hlm.dev"

EXPOSE 3000

WORKDIR /usr/src/app

ADD package*.json .

RUN npm ci --omit=dev && rm package*.json

COPY app.js .

CMD [ "node", "app.js" ]