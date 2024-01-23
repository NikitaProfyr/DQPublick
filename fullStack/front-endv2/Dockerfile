FROM node:14

WORKDIR /front-end/

#COPY package.json ./package.json
COPY . .
#COPY frontapp/package.json frontapp/package.json


RUN npm install
CMD ["cd", "frontapp"]
RUN npm install


