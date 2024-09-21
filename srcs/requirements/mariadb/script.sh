#!/bin/bash

sleep 5

# rm -rf /var/lib/mysql/*

echo "Starting"
tail -f
# service mariadb start 
# sleep 1

# echo "CREATE USER '$MARIADB_USER'@'' IDENTIFIED BY '$MARIADB_PASSWORD';" | mariadb
# sleep 1

# echo "GRANT ALL PRIVILEGES ON *.* TO '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD';" | mariadb
# sleep 1

# echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD';" | mariadb
# sleep 1

# echo "FLUSH PRIVILEGES;" | mariadb
# sleep 1

# echo "CREATE DATABASE $MARIADB_DATABASE;" | mariadb
# sleep 1

# service mariadb stop
# sleep 1

# echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD' ;" | mariadb -uroot -p$MARIADB_ROOT_PASSWORD --socket=/run/mysqld/mysqld.sock 
# sleep 1

# echo "FLUSH PRIVILEGES;" | mariadb -uroot -p$MARIADB_ROOT_PASSWORD --socket=/run/mysqld/mysqld.sock
# sleep 1

# exec mysqld --socket=/run/mysqld/mysqld.sock --pid-file=/run/mysqld/mysqld.pid