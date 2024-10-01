#!/bin/bash

cd /var/www/html

if [ ! -f "/var/www/html/wp-config.php" ]; then
	wp cli update --yes --allow-root
	wp core download --allow-root
	wp config create --dbname=${MARIADB_DATABASE} --dbuser=${MARIADB_USER} --dbpass=${MARIADB_PASSWORD} --dbhost=mariadb --allow-root --path=/var/www/html
	wp core install --url=${DOMAIN_NAME} --title=title --admin_user=${WORDPRESS_ADMIN} --admin_password=${WORDPRESS_ADMIN_PASSWORD} --admin_email=${WORDPRESS_ADMIN_EMAIL} --allow-root
	wp theme install teluro --activate --allow-root
	wp user create "${WORDPRESS_USER}" "${WORDPRESS_USER_EMAIL}" --role=author --user_pass=${WORDPRESS_USER_PASSWORD} --display_name="${MARIADB_USER}" --allow-root
else
	echo "Wordpress already installed"
fi

exec /usr/sbin/php-fpm7.4 -F

while true; do
	echo "ERROR STARTING PHP-FPM"
	sleep 1
done