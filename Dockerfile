# Builder
FROM node:19-alpine AS builder
LABEL org.opencontainers.image.authors="octavian@hlm.dev"
WORKDIR /usr/src/app
ENV NODE_ENV=production
RUN chown node:node ./
USER node
ADD package*.json .
RUN npm ci --only=production

# Runner
FROM node:19-alpine AS runner
LABEL org.opencontainers.image.authors="octavian@hlm.dev"
WORKDIR /usr/src/app
EXPOSE 3000
USER node
COPY --from=builder --chown=node:node /usr/src/app/node_modules ./node_modules
COPY app.js .
CMD [ "node", "app.js" ]