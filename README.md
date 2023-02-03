# Laravel in Docker v4

This package will allow you to run your Laravel app on the Docker environment in the very simple way.

You will be able to run a completely new Laravel project instance in the latest version but also the already existing project.

**IMPORTANT:** If you want to run already existing project, you have to ensure that his `.env` file exists, because this package
will make some modifications inside it.

This package runs following tools:

- PHP 8.2
- NGINX server
- MySQL in the latest version
- RabbitMQ
- Redis

After run once `docker-compose up` command, your application will be ready to use!

## Install package
```shell
composer create-project solidcode-kch/laravel-in-docker
```

## How to run the Laravel application?
In order to run docker container from this package, simply go to the `laravel-in-docker` directory, 
create the `.env` file based on the `.env.example` file (`cp .env.example .env`) and run 
```shell
docker-compose up
```
(wait until NGINX server will be running).
Then your application will be available on the URL: [http://localhost:9999](http://localhost:9999) 
and will be connected to the MySQL database.

You have many of possibilities to customize variables in the `.env` file. Please do it, before run `docker-compose up` if you need.

- `NGINX_PORT` - port where your NGINX server will be started and where your application will be available, e.g. [http://localhost:9999](http://localhost:9999)
- `APP_CONTAINER_NAME` - name of the newly created `app` container 
(will be shown when you run the `docker ps` or the `docker-compose ps` command)
- `LARAVEL_APP_LOCATION` - location on your computer where the application will be or is already stored 
(as default is set as the same directory as docker configuration) - it must be without `/` at the end
- `LARAVEL_APP_NAME` - name of the directory where files from your application will be or is already stored
(as default your application files are stored in `laravel-in-docker/laravel-app` directory)
- `MYSQL_PORT` - port where your database will be available from your local machine 
- `MYSQL_CONTAINER_NAME` - name of the newly created `mysql` container 
(will be shown when you run the `docker ps` or the `docker-compose ps` command)
- `MYSQL_ROOT_PASSWORD` - password for the root user of the newly created or already existing MySQL engine
- `MYSQL_DATABASE` - name of the newly created or already existed database where are or will be stored tables with data for the Laravel application
- `MYSQL_USER` - name of the newly created or already existed database user
- `MYSQL_PASSWORD` - password for the user that is the owner of the newly created or already existed database
- `RABBITMQ_CONTAINER_NAME` - name of the newly created `rabbitmq` container
(will be shown when you run the `docker ps` or the `docker-compose ps` command)
- `RABBITMQ_PORT` - port where your RabbitMQ console will be available from the local machine, e.g. [http://localhost:15672](http://localhost:15672)
- `REDIS_CONTAINER_NAME` - name of the newly created `redis` container
  (will be shown when you run the `docker ps` or the `docker-compose ps` command)
- `REDIS_PORT` - port where your Redis will be available from the local machine, e.g. [http://localhost:6379](http://localhost:6379)

## How to run Artisan commands?
In order to run artisan commands (or install composer dependencies) please run: 
`docker exec -it laravel_app bash` (in any location on your local machine) or
`docker-compose exec app bash` in the `laravel-in-docker` directory (where the `docker-compose.yml` file is stored).
