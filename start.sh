#!/bin/sh
set -e
rm -f /run/apache2/httpd.pid
rm -rf /run/supervisor; mkdir -p /run/supervisor

supervisord -c /etc/supervisord.conf

