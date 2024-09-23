FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y mariadb-server mariadb-client && \
    mkdir -p /run/mysqld && \
    chown -R mysql:mysql /run/mysqld

COPY ./50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./script.sh /
RUN chmod +x script.sh

EXPOSE 3306

ENTRYPOINT [ "./script.sh" ]

CMD [ "mysqld" ]