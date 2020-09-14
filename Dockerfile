FROM node:10.1
# designating location
WORKDIR /usr/src/app
# copy all files to this location
COPY . /usr/src/app 

RUN npm install

RUN npm run build

EXPOSE 3000

ENTRYPOINT ["node", "./server/server.js"]


