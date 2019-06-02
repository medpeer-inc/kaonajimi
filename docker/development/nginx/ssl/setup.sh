#!/bin/bash

readonly SSL_DOMAIN="*.kaonajimi.test"

openssl genrsa -out key 2048
openssl rsa -in key -out dev.key
rm key

echo -e "JP\nTokyo\nhigashiginza\nmedpeer\ndev\n$SSL_DOMAIN\n\n\n\n"\
| openssl req -new -key dev.key -out dev.csr

openssl x509 -in dev.csr -days 365 -req -signkey dev.key -sha256 -out dev.crt
