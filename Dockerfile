FROM node:15.8-alpine3.10 

RUN mkdir -p /usr/src/app && chown node:node /usr/src/app

USER node

WORKDIR /usr/src/app

COPY --chown=node:node package*.json ./

RUN npm ci --only=production

COPY . .

CMD [ "node", "server.js" ]