FROM nginx:alpine

RUN apk add --no-cache openssl py2-pip apache2-utils
RUN pip install xkcdpass

RUN mkdir -p /etc/nginx/ssl /deluge/completed

VOLUME /deluge/completed

EXPOSE 443

COPY container /
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD []
