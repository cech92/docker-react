FROM node:alpine
WORKDIR '/var/www/react-app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=0 /var/www/react-app/build /usr/share/nginx/html
