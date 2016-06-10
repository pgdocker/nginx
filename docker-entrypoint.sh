#!/bin/sh

set -e

# copy tmpl files to config files
find /etc/nginx -depth -name "*.tmpl" -exec sh -c 'cp "$1" "${1%.tmpl}.conf"' _ {} \;

# replace env vars
/usr/local/bin/ep -v /etc/nginx/**/*.conf

# start nginx
/usr/sbin/nginx
