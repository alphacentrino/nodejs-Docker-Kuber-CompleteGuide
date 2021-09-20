FROM node:alpine AS builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
#CMD ["npm","run","build"]

FROM nginx
WORKDIR /usr/share/nginx/html
COPY --from=builder  /app/build .
#CMD [ "nginx","start" ] don't need to start explicitly. It will start by default
