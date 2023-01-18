#!/bin/bash
set -e

create-project() {
  echo "Creating project..."
  if [ -z "$(ls -A /laravel-app)" ]; then
    cd /laravel-app
    composer create-project laravel/laravel .
  fi
  echo "Project created."
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

create-project
start-php
start-nginx
