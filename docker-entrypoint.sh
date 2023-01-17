#!/bin/bash
set -e

create-project() {
  echo "Creating project..."
  cd /laravel-app
  composer create-project laravel/laravel .
}

create-project

exec nginx -g 'daemon off;'
