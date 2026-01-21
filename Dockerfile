FROM node:20-alpine AS deps
WORKDIR /app
COPY package*.json ./
RUN npm install


FROM deps AS test
COPY . .
RUN npm test


FROM node:20-alpine AS production
WORKDIR /app

COPY package*.json ./
RUN npm install --production

COPY --from=test /app/app.js ./app.js
COPY --from=test /app/index.js ./index.js

EXPOSE 3000
CMD ["node", "index.js"]

