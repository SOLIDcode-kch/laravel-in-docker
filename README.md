## Laravel-in-docker APP v2

Thanks to this docker-based configuration, you will be able to run the latest version of the Laravel framework. 

Your project will be run on the NGINX server and the PHP in the version 8.2. 
All database env variables are automatically sed to the application, so you can use start coding with initialized db 
and without making any changes in the Laravel `.env` file.

The database engine is MySQL in the latest version.

## Requirements
- Docker
- docker-compose

## Running instructions
* Clone the repository (or download the package as the ZIP archive)
* Run `cp .env.example .env`
* Customize environmental variables in the ENV file if you need
  * `NGINX_PORT` - nginx port where your application will be available
  * `APP_CONTAINER_NAME` - newly created Docker container (with PHP, NGINX and Laravel inside) name
  * `LARAVEL_APP_LOCATION` - the location where the newly created application will be stored - 
  as default will be in the same directory
  * `LARAVEL_APP_NAME` - name of the newly created laravel-app <br />
  (the patch to your application on your disk storage will be `LARAVEL_APP_LOCATION/LARAVEL_APP_NAME`, e.g. `./laravel-app`)
  * `MYSQL_PORT` - MySQL port where you DB will be available
  * `MYSQL_CONTAINER_NAME` - newly created MySQL container name
  * `MYSQL_ROOT_PASSWORD` - Password for the root user of the database
  * `MYSQL_DATABASE` - Name of the database
  * `MYSQL_USER` - Name of the not-root database user
  * `MYSQL_PASSWORD` - Password for the not-root database user 
* Run `docker-compose up`

Right after all steps above are done, your clear laravel application should be installed in the directory 
indicated by you and should be available on `http://localhost{NGINX_PORT}`, e.g.`http://localhost:9999`

## Using docker
In order to artisan / composer commands, pleas go to the directory that contains `docker-compose.yml` file and run
`docker-compose exec app bash`.
