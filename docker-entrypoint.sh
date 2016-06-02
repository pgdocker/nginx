#!/bin/sh

set -e

# copy tmpl files to config files
for f in /etc/nginx/*.tmpl; do
        cp $f "/etc/nginx/$(basename "$f" .tmpl).conf"
done

# replace env vars
/usr/local/bin/ep -v /etc/nginx/*.conf

# start nginx
/usr/sbin/nginx
