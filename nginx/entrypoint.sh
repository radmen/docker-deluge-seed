#!/bin/sh

openssl req \
    -nodes \
    -x509 \
    -newkey rsa:4096 \
    -keyout /etc/nginx/ssl/nginx.key \
    -out /etc/nginx/ssl/nginx.crt \
    -subj "/C=GB/ST=London/L=London/O=Global Security/OU=IT Department/CN=example.com"

PASSWORD=$(xkcdpass -n 2)
htpasswd -bc /etc/nginx/.htpasswd deluge "$PASSWORD"

echo ""
echo "HTTP basic auth: deluge / $PASSWORD"
echo ""

nginx -g "daemon off;"
