FROM debian:bullseye

RUN apt update && \
	apt install mariadb-client php-fpm php-mysql php-gd php-curl php-xml curl gettext -y && \
	apt upgrade php-fpm -y && \
	mkdir -p /var/www/html/


COPY script.sh /
COPY wp-config.php.template /
RUN chmod +x script.sh
RUN chmod +x wp-config.php.template

CMD ["./script.sh"]