#building phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#run phase
FROM nginx
#all we need is what has been built from the build @ /app/build
COPY --from=builder /app/build /usr/share/nginx/html
