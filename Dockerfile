FROM node:12-alpine AS base

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

USER node
ENV PORT=443
EXPOSE 443

CMD [ "node", "dist/main.js" ]

