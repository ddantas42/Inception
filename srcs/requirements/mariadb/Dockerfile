FROM debian:bullseye

# Install MariaDB and its dependencies
RUN apt update && \
    apt install mariadb-server mariadb-client -y

# Copy custom MySQL configuration file
COPY my.cnf /etc/mysql/my.cnf

RUN mkdir /var/run/mysqld && chown mysql:mysql /var/run/mysqld

USER mysql

# Expose port 3306 for MySQL
EXPOSE 3306

# Default CMD to run the server
CMD ["mysqld", "--user=mysql", "--console"]
