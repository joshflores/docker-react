FROM node:alpine as builder
WORKDIR '/app/src'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
# only for EBS, it looks and exposes 80
EXPOSE 80
COPY --from=builder /app/src/build /usr/share/nginx/html