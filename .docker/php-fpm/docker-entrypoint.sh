#!/bin/bash
set -e

set-valid-permissions() {
  echo "Setting permissions for the laravel project..."
  find /laravel-app -type f -exec chmod 644 {} \;
  find /laravel-app -type d -exec chmod 755 {} \;
}

create-new-project() {
  echo "Creating project..."
  composer create-project laravel/laravel .
  echo "Project created"
}

prepare-db-envs() {
  echo "Preparing envs for database connection..."
  sed -i -r "s/^(DB_HOST=).*/\1mysql/g" /laravel-app/.env
  sed -i -r "s/^(DB_DATABASE=).*/\1$1/g" /laravel-app/.env
  sed -i -r "s/^(DB_USERNAME=).*/\1$2/g" /laravel-app/.env
  sed -i -r "s/^(DB_PASSWORD=).*/\1$3/g" /laravel-app/.env
  echo "Database envs prepared."
}

prepare-redis-envs() {
  echo "Preparing envs for redis connection..."
  echo "REDIS_CLIENT=predis" >> /laravel-app/.env
  sed -i -r "s/^(REDIS_HOST=).*/\1redis/g" /laravel-app/.env
  echo "Redis envs prepared."
}

init-db() {
  waitforit -address=mysql:3306 -timeout=30 -- echo "MySQL is up!"
  echo "Initializing database..."
  php artisan migrate && php artisan db:seed
  echo "Database initialized."
}

init-project() {
  if [ -z "$(ls -A /laravel-app)" ]; then
    create-new-project
    set-valid-permissions
    prepare-db-envs ${MYSQL_DATABASE} ${MYSQL_USER} ${MYSQL_PASSWORD}
    prepare-redis-envs
  else
    echo "Project exists."
  fi

  init-db
}

start-php() {
  echo "Running php-fpm..."
  php-fpm -D
  echo "PHP run."
}

start-nginx() {
  echo "Starting NGINX..."
  nginx -g 'daemon off;'
}

init-project
start-php
start-nginx
