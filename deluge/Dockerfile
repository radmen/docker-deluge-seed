FROM alpine:edge

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN apk add --no-cache deluge \
        py2-pip \
        gettext \
        openssl

RUN apk add -t .deps --no-cache gcc \
                python2-dev \
                linux-headers \
                musl-dev \
                libffi-dev \
                openssl-dev \
        && pip install incremental \
                constantly \
                automat \
                service_identity \
        && apk del .deps

RUN mkdir -p /deluge/config \
        /deluge/config/state \
        /deluge/completed \
        /deluge/downloads \
        /deluge/torrents

COPY container /
COPY entrypoint.sh /entrypoint.sh

VOLUME /deluge/completed

EXPOSE 8112
ENTRYPOINT ["/entrypoint.sh"]
CMD ["deluge-web", "-c", "/deluge/config", "-d"]
