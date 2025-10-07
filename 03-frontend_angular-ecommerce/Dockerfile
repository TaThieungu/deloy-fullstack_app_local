# Stage 1: Build Angular app
FROM node:18 as build

WORKDIR /app

# copy package.json trước để cache npm install
COPY package*.json ./

RUN npm ci

# copy code còn lại (nhờ .dockerignore nên ko kéo node_modules/dist)
COPY . .

# build Angular
RUN npm run build --prod

# Stage 2: Serve with Nginx
FROM nginx:stable-alpine

COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
