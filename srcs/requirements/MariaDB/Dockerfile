FROM alpine:3.20.1

# Install MariaDB
RUN apk --no-cache add mariadb mariadb-client

# Create necessary directories and set permissions
RUN mkdir -p /run/mysqld \
    && chown -R mysql:mysql /run/mysqld \
    && mkdir -p /var/lib/mysql \
    && chown -R mysql:mysql /var/lib/mysql

# Copy custom MySQL configuration file
COPY my.cnf /etc/my.cnf

# Expose port 3306 for MySQL
EXPOSE 3306

# Start MariaDB server
CMD ["mysqld"]