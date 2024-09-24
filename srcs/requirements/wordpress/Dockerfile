FROM debian:bullseye

# Install MariaDB and its dependencies
# RUN apt update && \
	# apt install php php-common php-mysql php-gmp php-curl php-intl php-mbstring php-xmlrpc php-gd php-xml php-cli php-zip -y && \
	# apt install mariadb-client -y && \
	# mkdir -p /var/www/html/

COPY php.ini /etc/php/7.4/cli/php.ini

COPY script.sh /
RUN chmod +x script.sh


CMD [ "./script.sh" ]