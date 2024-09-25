FROM debian:bullseye

RUN apt update && \
	apt install wordpress curl mariadb-client php php-fpm -y && \
	mkdir -p /var/www/html/

COPY script.sh /
RUN chmod +x script.sh

CMD [ "./script.sh" ]