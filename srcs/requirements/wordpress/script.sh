#!/bin/bash

service php7.4-fpm start
service php7.4-fpm status

echo "Im Running!!"
tail -f