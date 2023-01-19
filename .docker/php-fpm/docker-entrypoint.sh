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

init-project() {
  if [ -z "$(ls -A /laravel-app)" ]; then
    create-new-project
    set-valid-permissions
  else
    echo "Project exists."
  fi
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
