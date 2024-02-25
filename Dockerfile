FROM node:alpine as builder
WORKDIR '/app/src'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/src/build /usr/share/nginx/html