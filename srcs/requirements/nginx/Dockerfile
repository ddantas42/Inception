FROM debian:bullseye

# Install MariaDB and its dependencies
RUN apt update && \
	apt install nginx -y

COPY script.sh /
RUN chmod +x script.sh

ENTRYPOINT [ "./script.sh" ]