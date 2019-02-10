#builder phase
FROM node:alpine AS builder

WORKDIR '/app'

COPY  package.json .

RUN npm install

COPY . .

RUN npm run build

# /app/build
# run phase
FROM nginx 

# i want to copy something from that other phase(builder)
COPY --from=builder  /app/build /usr/share/nginx/html