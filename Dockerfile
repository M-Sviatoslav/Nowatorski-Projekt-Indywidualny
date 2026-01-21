FROM node:20-alpine AS deps
WORKDIR /app
COPY package*.json ./
RUN npm install


FROM deps AS test
WORKDIR /app
COPY . .          # kopiujemy cały projekt
RUN npm test      # uruchamiamy testy


FROM node:20-alpine AS production
WORKDIR /app
COPY package*.json ./
RUN npm install --production
COPY --from=test /app .  # kopiujemy pliki źródłowe z test stage
EXPOSE 3000
CMD ["node", "index.js"]


