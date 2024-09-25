FROM debian:bullseye

RUN apt update && \
	apt install nginx openssl -y

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 433

CMD [ "nginx", "-g", "daemon off;" ]