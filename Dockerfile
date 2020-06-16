FROM node:alpine as builder
WORKDIR '/var/www/react-app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /var/www/react-app/build /usr/share/nginx/html
