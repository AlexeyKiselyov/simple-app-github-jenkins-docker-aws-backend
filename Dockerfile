FROM node:alpine

ARG PORT

ARG DB_HOST

ENV PORT=$PORT

ENV DB_HOST=$DB_HOST

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 4000

CMD ["npm", "run", "start:dev"]