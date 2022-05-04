# Dockerfile for enviroment Dev
FROM node:16

WORKDIR /app
RUN npm install -g npm@8.1.3
RUN npm install -g @vue/cli@4.5.15
COPY package.json ./
COPY package-lock.json ./
COPY vite.config.js ./
RUN npm install
COPY . .
EXPOSE 3004

CMD ["npm", "run", "dev"]
