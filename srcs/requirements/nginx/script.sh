#!/bin/bash

envsubst < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

service nginx status

echo "Starting Nginx"
exec nginx -g "daemon off;"


while [ $? -ne 0 ]; do
	echo "Nginx is not running"
	sleep 1
	service nginx status
done