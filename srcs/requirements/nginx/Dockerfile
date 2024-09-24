FROM debian:bullseye

# Install MariaDB and its dependencies
RUN apt update && \
	apt install nginx openssl -y

COPY script.sh /
RUN chmod +x script.sh

RUN service nginx start

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 9000


CMD [ "./script.sh" ]
# CMD [ "nginx", "-g", "'daemon off;'" ]