#!/bin/bash

echo "------------------- INITIATING DB -------------------"

mysqld --user=root --socket=/run/mysqld/mysqld.sock --datadir='/var/lib/mysql' &

sleep 5

echo "----------------- ROOT PASSWORD AND USER ------------"

mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD';" -p"$MARIADB_ROOT_PASSWORD"
echo "Root password changed"

mysql -u root -e "ALTER USER '$MARIADB_USER'@'localhost' IDENTIFIED BY '$MARIADB_PASSWORD';" -p"$MARIADB_ROOT_PASSWORD"
echo "User password changed"

echo "------------------- SETUP DB -------------------"

DB_EXISTS=$(mysql -u root -p"$MARIADB_ROOT_PASSWORD" -e "SELECT SCHEMA_NAME FROM information_schema.SCHEMATA WHERE SCHEMA_NAME = '$MARIADB_DATABASE';")

if [ -z "$DB_EXISTS" ]; then
  echo "Database $MARIADB_DATABASE does not exist. Creating..."
  mysql -u root -p"$MARIADB_ROOT_PASSWORD" -e "CREATE DATABASE \`$MARIADB_DATABASE\`;"
else
  echo "Database $MARIADB_DATABASE already exists."
fi

echo "------------------- DONE SETUP DB -------------------"

echo "------------------- Restarting DB -------------------"

mysqladmin -u root -p"$MARIADB_ROOT_PASSWORD" shutdown

exec mysqld --user=root --socket=/run/mysqld/mysqld.sock --datadir='/var/lib/mysql'