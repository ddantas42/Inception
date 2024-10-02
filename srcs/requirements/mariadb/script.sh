#!/bin/bash

echo "------------------- INITIATING DB -------------------"

if [ -z "$(ls -A /var/lib/mysql)" ]; then
  mysqld --user=root --socket=/run/mysqld/mysqld.sock --datadir='/var/lib/mysql' &


  sleep 5

  echo "done"
  
  # mysqladmin -u root -p"$MARIADB_ROOT_PASSWORD" shutdown
  service mariadb stop

fi


mysqld --user=root --socket=/run/mysqld/mysqld.sock --datadir='/var/lib/mysql' &




while [ ! -S /run/mysqld/mysqld.sock ]; do
    echo "Waiting for MySQL to start..."
    sleep 1
done

echo "----------------- ROOT PASSWORD AND USER ------------"

mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD';" -p"$MARIADB_ROOT_PASSWORD"
echo "Root password changed"

mysql -u root -e "ALTER USER '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD';" -p"$MARIADB_ROOT_PASSWORD"
echo "User password changed"


echo "------------------- SETUP DB -------------------"

DB_EXISTS=$(mysql -u root -p"$MARIADB_ROOT_PASSWORD" -e "SELECT SCHEMA_NAME FROM information_schema.SCHEMATA WHERE SCHEMA_NAME = '$MARIADB_DATABASE';")

if [ -z "$DB_EXISTS" ]; then
  echo "Database $MARIADB_DATABASE does not exist. Creating..."
  mysql -u root -p"$MARIADB_ROOT_PASSWORD" -e "CREATE DATABASE \`$MARIADB_DATABASE\`;" -p"$MARIADB_ROOT_PASSWORD"
else
  echo "Database $MARIADB_DATABASE already exists."
fi

mysql -u root -e "GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD';" -p"$MARIADB_ROOT_PASSWORD"
mysql -u root -e "FLUSH PRIVILEGES;" -p"$MARIADB_ROOT_PASSWORD"

echo "------------------- DONE SETUP DB -------------------"

echo "------------------- Restarting DB -------------------"

mysqladmin -u root -p"$MARIADB_ROOT_PASSWORD" shutdown

exec mysqld --user=root --socket=/run/mysqld/mysqld.sock --datadir='/var/lib/mysql'
