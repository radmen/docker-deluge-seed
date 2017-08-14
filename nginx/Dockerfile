FROM nginx:alpine

RUN apk add --no-cache openssl

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -nodes \
        -x509 \
        -newkey rsa:4096 \
        -keyout /etc/nginx/ssl/nginx.key \
        -out /etc/nginx/ssl/nginx.crt \
        -subj "/C=GB/ST=London/L=London/O=Global Security/OU=IT Department/CN=example.com"

RUN mkdir -p /deluge/completed

VOLUME /deluge/completed

EXPOSE 443

COPY container /
