#!/bin/bash

envsubst < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

service nginx status

echo "Starting Nginx"
exec nginx -g "daemon off;"


echo "Didnt work!!"