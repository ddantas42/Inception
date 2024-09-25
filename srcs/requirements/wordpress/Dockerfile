FROM debian:bullseye

RUN apt update && \
	apt install wordpress curl mariadb-client php php-fpm -y && \
	mkdir -p /var/www/html/

RUN groupadd wordpress_user && useradd -g wordpress_user wordpress_user

RUN sed -i 's/;daemonize = yes/daemonize = no/' /etc/php/7.4/fpm/php-fpm.conf

COPY wordpress_pool.conf /etc/php/7.4/fpm/pool.d/wordpress_pool.conf

COPY script.sh /
RUN chmod +x script.sh

CMD ["./script.sh"]