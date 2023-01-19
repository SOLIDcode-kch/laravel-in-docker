FROM php:8.2-fpm-alpine

RUN apk add --no-cache \
    git \
    nginx \
    openssh-client \
    bash

RUN curl -o /usr/local/bin/waitforit -sSL https://github.com/maxcnunes/waitforit/releases/download/v2.4.1/waitforit-linux_amd64
RUN chmod +x /usr/local/bin/waitforit

RUN docker-php-ext-install pdo pdo_mysql

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

ENTRYPOINT ["/docker-files/docker-entrypoint.sh"]
