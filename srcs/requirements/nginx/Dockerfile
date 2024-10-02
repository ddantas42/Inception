FROM debian:bullseye

RUN apt-get update -y \
	&& apt-get upgrade -y \
	&& apt-get install -y nginx curl

RUN	mkdir -p /etc/nginx/ssl /var/www /run/nginx

RUN curl -JLO "https://dl.filippo.io/mkcert/latest?for=linux/amd64" && \
	chmod +x mkcert-v*-linux-amd64 && \
	cp mkcert-v*-linux-amd64 /usr/local/bin/mkcert

RUN mkcert ddantas-.42.fr && \
	cp ddantas-.42.fr* /etc/nginx/ssl

COPY nginx.conf /etc/nginx/conf.d/nginx.conf

EXPOSE 433

CMD ["nginx", "-g", "daemon off;"]