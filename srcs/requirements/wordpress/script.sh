#!/bin/bash


# sleep 10

# cd /var/www/html

if [ "$(ls -A /var/www/html)" ]; then
    rm -rf /var/www/html/*
fi


cd /var/www/html

wget https://wordpress.org/latest.zip
unzip latest.zip
rm latest.zip
mv wordpress/* .
rm -rf wordpress

envsubst < /wp-config.php.template > /var/www/html/wp-config.php

sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf

sed -i '50i\$table_prefix = '\''wp_'\'';' /var/www/html/wp-config.php



tail -f

# curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
# chmod +x wp-cli.phar 
# mv wp-cli.phar /usr/local/bin/wp

# echo "wp core download --allow-root"
# wp core download --allow-root

# envsubst < /wp-config.php.template > /var/www/html/wp-config.php

# if [ -e /etc/php/7.4/fpm/pool.d/www.conf ]; then
#   sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf
# else
#   echo "HELP"
# fi

# wp core install --url=$DOMAIN_NAME/ --title=wp --admin_user=$MARIADB_USER --admin_password=$MARIADB_PASSWORD --admin_email=$WODPRESS_ADMIN_EMAIL --skip-email --allow-root

# wp user create $WORDPRESS_USER $WORDPRESS_USER_EMAIL --role=author --user_pass=$WORDPRESS_USER_PASSWORD --allow-root

# wp theme install astra --activate --allow-root

# wp plugin update --all --allow-root

# mkdir -p /run/php



echo "Startin PHP-FPM"

/usr/sbin/php-fpm7.4 -F

while true; do
	echo "ERROR STARTING PHP-FPM"
	sleep 1
done