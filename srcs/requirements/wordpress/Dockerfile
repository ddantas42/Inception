FROM debian:bullseye

# Install MariaDB and its dependencies
RUN apt update && \
	apt upgrade && \
	apt install php php-common php-mysql php-gmp php-curl php-intl php-mbstring php-xmlrpc php-gd php-xml php-cli php-zip

COPY php.ini /etc/php/7.4/cli/php.ini

