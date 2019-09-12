#!/bin/sh
set -xe
: "${WELCOME_MESSAGE?Need an api url}"

ls /usr/share/nginx/html/

sed -i "s~{{{WELCOME_MESSAGE}}}~$WELCOME_MESSAGE~g" /usr/share/nginx/html/main-es5.*.js
sed -i "s~{{{WELCOME_MESSAGE}}}~$WELCOME_MESSAGE~g" /usr/share/nginx/html/main-es2015.*.js

exec "$@"
