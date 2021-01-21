FROM node:12-alpine
WORKDIR /app
COPY . .
RUN npm install --production
EXPOSE 8080
CMD [ "node", "app.js" ]
