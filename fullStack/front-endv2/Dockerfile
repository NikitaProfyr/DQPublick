FROM node:14

WORKDIR /front-end/

COPY package.json ./package.json
COPY frontapp/package.json frontapp/package.json
COPY frontapp/public frontapp/public
COPY frontapp/src frontapp/src


RUN npm install
WORKDIR /front-end/frontapp/
RUN npm install
RUN npm install -g react-scripts@5.0.1


