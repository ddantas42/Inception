FROM debian:bullseye

# Install MariaDB and its dependencies
RUN apt update && \
	apt install nginx openssl -y

COPY script.sh /
RUN chmod +x script.sh

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 433


CMD [ "nginx", "-g", "daemon off;" ]