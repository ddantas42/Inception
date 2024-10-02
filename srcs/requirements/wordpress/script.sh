#!/bin/bash

cd /var/www/html

function  maria_running() {
	nc -z "mariadb" "3306"
}

function is_user_created() {
	mysql -h mariadb -u "$MARIADB_USER" -p"$MARIADB_PASSWORD" -e "USE $MARIADB_DATABASE"
}

until maria_running && is_user_created; do
	echo 'Waiting for MariaDB'
	sleep 7
done
echo 'MariaDB connected'

if [ ! -f "/var/www/html/wp-config.php" ]; then
	wp cli update --yes --allow-root
	wp core download --allow-root
	wp config create --dbname=${MARIADB_DATABASE} --dbuser=${MARIADB_USER} --dbpass=${MARIADB_PASSWORD} --dbhost=mariadb --allow-root --path=/var/www/html
	wp core install --url=${DOMAIN_NAME} --title=title --admin_user=${WORDPRESS_ADMIN} --admin_password=${WORDPRESS_ADMIN_PASSWORD} --admin_email=${WORDPRESS_ADMIN_EMAIL} --allow-root
	wp theme install memberlite --activate --allow-root
	wp user create "${WORDPRESS_USER}" "${WORDPRESS_USER_EMAIL}" --role=author --user_pass=${WORDPRESS_USER_PASSWORD} --display_name="${WORDPRESS_USER}" --allow-root
else
	echo "Wordpress already installed"
fi

echo "Starting php-fpm"
exec /usr/sbin/php-fpm7.4 -F