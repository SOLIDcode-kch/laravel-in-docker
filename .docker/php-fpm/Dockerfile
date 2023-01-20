FROM php:8.2-fpm-alpine

ARG DB_NAME
ARG DB_USER
ARG DB_PASSWORD

ENV db_name=${DB_NAME}
ENV db_user=${DB_USER}
ENV db_password=${DB_PASSWORD}

RUN apk add --no-cache \
    git \
    nginx \
    openssh-client \
    bash

RUN curl -o /usr/local/bin/waitforit -sSL https://github.com/maxcnunes/waitforit/releases/download/v2.4.1/waitforit-linux_amd64
RUN chmod +x /usr/local/bin/waitforit

RUN docker-php-ext-install pdo pdo_mysql

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT docker-entrypoint.sh $db_name $db_user $db_password
