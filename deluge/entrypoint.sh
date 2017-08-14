#!/bin/sh

set -eu

DELUGE_PWD=$(xkcdpass -n 2)
DELUGE_PWD_SALT=$(openssl rand 10 | xxd -p | tr -d " ")
DELUGE_PWD_SHA1=$(echo -n "${DELUGE_PWD_SALT}${DELUGE_PWD}" | openssl dgst -sha1 -binary | xxd -p | tr -d " ")

export DELUGE_PWD_SALT
export DELUGE_PWD_SHA1

envsubst < /deluge/config/web.conf.tmpl > /deluge/config/web.conf

echo ""
echo "Deluge web-ui password: ${DELUGE_PWD}"
echo ""

deluge-web -c /deluge/config $@
