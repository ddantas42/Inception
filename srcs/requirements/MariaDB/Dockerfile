FROM alpine:3.20.1

# Install MariaDB and its dependencies
RUN apk update && \
    apk add --no-cache mariadb mariadb-client mariadb-server-utils

# Create necessary directories with proper permissions
RUN mkdir -p /var/lib/mysql /var/run/mysqld /var/log/mysql && \
    chown -R mysql:mysql /var/lib/mysql /var/run/mysqld /var/log/mysql

# Copy custom MySQL configuration file
COPY my.cnf /etc/my.cnf

# Expose port 3306 for MySQL
EXPOSE 3306

# Set default user
USER mysql

# Start MariaDB server
CMD ["mysqld_safe"]