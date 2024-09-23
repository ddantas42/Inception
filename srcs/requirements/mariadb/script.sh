#!/bin/bash

echo "------------------- INITIATING DB -------------------"
mysqld --user=root --socket=/run/mysqld/mysqld.sock --datadir='/var/lib/mysql' &

sleep 5

echo "------------------- ROOT PASSWORD AND USER -------------------"
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD';" -p"$MARIADB_ROOT_PASSWORD"
mysql -u root -e "ALTER USER '$MARIADB_USER'@'localhost' IDENTIFIED BY '$MARIADB_PASSWORD';" -p"$MARIADB_ROOT_PASSWORD"

echo "------------------- SETUP DB -------------------"

# mysql -u root -e "CREATE DATABASE $MARIADB_DATABASE;" -p"$MARIADB_ROOT_PASSWORD"
echo "CREATE DATABASE $MARIADB_DATABASE ;" | mysql -u root -p"$MARIADB_ROOT_PASSWORD"

echo "------------------- DONE SETUP DB -------------------"

tail -f