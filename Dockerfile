# Install node dependencies. Keep these in a seperate container named 'base' to speed up deployment.
FROM node:alpine AS base
WORKDIR /usr/src/app
COPY package*.json ./

RUN npm install

# Build angular project
FROM base AS build
COPY src src
COPY angular.json .
COPY tsconfig.json .
COPY tsconfig.app.json .

RUN npm run build

# Setup nginx and use entryPoint.sh to string replace config tokens.
FROM nginx:alpine
COPY --from=build usr/src/app/dist/ /usr/share/nginx/html
COPY ./build/nginx.conf /etc/nginx/
COPY ./build/default.conf /etc/nginx/conf.d/
COPY ./build/entryPoint.sh /entryPoint.sh

ENTRYPOINT ["/bin/sh", "/entryPoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
