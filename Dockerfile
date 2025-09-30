FROM node:14-alpine3.17
RUN apk update && apk add --no-cache bash git ffmeg imagemagick
    
ENV NODE_ENV=production

WORKDIR /pisignage-server

COPY ["package.json", "package-lock.json*"]

RUN npm install --production

COPY . .

CMD [ "./wait-for-it.sh", "mongo:27017", "--", "node", "server.js"]
