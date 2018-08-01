FROM nginx:alpine

COPY files/nginx.conf /etc/nginx/nginx.conf

WORKDIR /usr/share/nginx/html
COPY web/ .