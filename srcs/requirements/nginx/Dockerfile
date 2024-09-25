FROM debian:bullseye

RUN apt update && \
	apt install nginx openssl \
	certbot python3-certbot-nginx \
	install gettext -y && \
	mkdir -p /var/www/html/

	
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/selfsigned.key -out /etc/nginx/ssl/selfsigned.crt \
    -subj "/C=US/ST=State/L=City/O=Company/OU=Org/CN=localhost"
	
COPY nginx.conf.template /etc/nginx/nginx.conf.template

COPY ./script.sh /
RUN chmod +x script.sh


EXPOSE 433

CMD [ "./script.sh" ]