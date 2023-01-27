FROM php:8.2-fpm-alpine

RUN apk add --no-cache \
    git \
    nginx \
    openssh-client \
    bash

RUN docker-php-ext-install pdo pdo_mysql

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]
