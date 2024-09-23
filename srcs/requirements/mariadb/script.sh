#!/bin/bash

echo "------------------- INITIATING DB -------------------"
mysqld --user=root --socket=/run/mysqld/mysqld.sock --datadir='/var/lib/mysql' &

sleep 5

echo "------------------- ROOT PASSWORD AND USER -------------------"
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD';" -p"$MARIADB_ROOT_PASSWORD"
mysql -u root -e "ALTER USER '$MARIADB_USER'@'localhost' IDENTIFIED BY '$MARIADB_PASSWORD';" -p"$MARIADB_ROOT_PASSWORD"

echo "------------------- DONE SETUP DB -------------------"
tail -f

# echo "n
# y
# y
# $MARIADB_ROOT_PASSWORD
# $MARIADB_ROOT_PASSWORD
# n
# n
# y" | mysql_secure_installation

# echo "Running mysql_upgrade as root..."
# mysql_upgrade --user=root --socket=/run/mysqld/mysqld.sock --force

# echo "Starting DB"
# exec mysqld_safe --datadir='/var/lib/mysql' --user=root --password="password" &

# sleep 5

# echo "CREATE USER '$MARIADB_USER'@'localhost' IDENTIFIED BY '$MARIADB_PASSWORD';" | mysql -u root -p"$MARIADB_ROOT_PASSWORD"
# echo "GRANT ALL PRIVILEGES ON *.* TO '$MARIADB_USER'@'localhost' WITH GRANT OPTION;" | mysql -u root
# echo "FLUSH PRIVILEGES;" | mysql -u root

# echo "User '$MARIADB_USER' created"


# tail -f