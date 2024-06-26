FROM alpine:3.20.1

RUN apk --no-cache add \
    php8 \
    php8-fpm \
    php8-mysqli \
    php8-json \
    php8-session \
    php8-zlib \
    php8-xml \
    php8-phar \
    php8-intl \
    php8-dom \
    php8-xmlreader \
    php8-ctype \
    php8-curl \
    php8-openssl \
    php8-mbstring \
    php8-gd \
    php8-zip \
    php8-soap \
    php8-xmlwriter \
    php8-simplexml \
    php8-tokenizer \
    php8-fileinfo \
    curl \
    tar \
    bash \
    nginx

# Download and extract WordPress
RUN curl -o /wordpress.tar.gz https://wordpress.org/latest.tar.gz \
    && tar -xzf /wordpress.tar.gz -C /var/www/html --strip-components=1 \
    && rm /wordpress.tar.gz

# Create necessary directories and set permissions
RUN mkdir -p /run/nginx /run/php \
    && chown -R nginx:nginx /var/www/html

# Copy custom php-fpm configuration file
COPY php-fpm.conf /etc/php7/php-fpm.d/www.conf

# Expose port 9000 for php-fpm
EXPOSE 9000

# Start php-fpm server
CMD ["php-fpm7", "-F"]