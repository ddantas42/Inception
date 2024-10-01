FROM debian:bullseye

RUN apt-get update -y \
	&& apt-get upgrade -y \
	&& apt-get install -y wget curl unzip php7.4 \
	php7.4-fpm php7.4-mysql php7.4-curl php7.4-gd \
	php7.4-xml php7.4-mbstring

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
chmod +x wp-cli.phar && \
mv wp-cli.phar /usr/local/bin/wp
	
RUN mkdir /run/php \
	&& chmod 755 /run/php/ \
	&& sed -i 's+listen = /run/php/php7.4-fpm.sock+listen = 9000+g' /etc/php/7.4/fpm/pool.d/www.conf

COPY script.sh /
RUN chmod +x script.sh

CMD ["./script.sh"]
