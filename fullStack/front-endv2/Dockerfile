FROM node:18-alpine

WORKDIR /app

COPY ./package.json ./package.json
COPY ./public ./public
COPY ./src ./src

RUN npm install
RUN npm install -g react-scripts@5.0.1


