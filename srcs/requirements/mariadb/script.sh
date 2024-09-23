#!/bin/bash

# Create mysqld run directory if it doesn't exist
mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld

# Initialize the database if it hasn't been initialized yet
if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Initializing MariaDB data directory..."
    mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
fi

# Start MariaDB in the background
echo "Starting MariaDB..."
mysqld_safe --datadir='/var/lib/mysql' &

# Wait until MariaDB is fully started by checking if the socket file exists
socket_file="/run/mysqld/mysqld.sock"
for i in {30..0}; do
    if [ -S "$socket_file" ]; then
        echo "MariaDB is up and running."
        break
    fi
    echo "Waiting for MariaDB to start..."
    sleep 1
done

if [ ! -S "$socket_file" ]; then
    echo "Error: MariaDB failed to start."
    exit 1
fi

# Run mysql_upgrade with root user using Unix socket authentication
echo "Running mysql_upgrade as root..."
mysql_upgrade --user=root --socket=/run/mysqld/mysqld.sock --force

# Keep the container running
tail -f /dev/null
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