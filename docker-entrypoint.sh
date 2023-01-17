#!/bin/bash
set -e

create-project() {
  echo "Creating project..."
  if [ -z "$(ls -A /laravel-app)" ]; then
    cd /laravel-app
    composer create-project laravel/laravel .
  fi
  echo "Project created..."
}

create-project

exec nginx -g 'daemon off;'
