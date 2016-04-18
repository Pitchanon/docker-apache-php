# Apache PHP Docker image

* [Docker Hub]

## Components

* Base: Ubuntu 14.04
* PHP 5.5 (tag: **5.5**)
* PHP 5.6 (tag: **5.6**)
* PHP 7.0 (tag: **5.7** or **latest**)
* PHP composer
* Apache 2.4 with mod_rewrite enabled

## Running & Building
### Using this container as a base
Use this container as a base for your application. Below is an example Dockerfile in which we add a VHost to the apache config:

```dockerfile
FROM pitchanon/docker-apache-php:5.5
... OR ...
FROM pitchanon/docker-apache-php:5.6
... OR ...
FROM pitchanon/docker-apache-php:7.0
... OR ...
FROM pitchanon/docker-apache-php:latest

...

ADD /path/to/vhost.conf /etc/apache2/sites-enabled/

CMD ["/run.sh"]
```

### Running

```sh
$ docker run -d -v /host/www:/var/www/html -p 9991:80 pitchanon/docker-apache-php
```

## Examples

### Docker Compose

In `docker-compose.yml` file.

```yml
test-web:
  build: web/
  ports:
    - 9991:80
  volumes:
    - ../:/var/www/html
  container_name: test_web
  links:
    - test-db:mysql
  env_file:
    - ./env/docker.env # environment-specific

test-db:
  image: pitchanon/docker-mysql:5.5
  container_name: test_mysql
  ports:
    - 33991:3306
  env_file:
    - ./env/docker.env # environment-specific

test-pma:
  image: pitchanon/phpmyadmin
  ports:
    - 32991:80
  container_name: test_phpmyadmin
  links:
    - test-db:mysql
  env_file:
    - ./env/docker-phpmyadmin.env
```

##### .env files

File `docker.env` in `./env/docker.env`.

```
#docker.env

ENVIRONMENT=docker

MYSQL_ROOT_PASSWORD=123456
MYSQL_PORT_3306_TCP_ADDR=192.168.99.100
MYSQL_PORT_3306_TCP_PORT=33991
```

File `docker-phpmyadmin.env` in `./env/docker-phpmyadmin.env`.

```
#docker-phpmyadmin.env

PMA_ARBITRARY=1
PMA_HOST=192.168.99.100
PMA_PORT=33991
PMA_USER=root
PMA_PASSWORD=123456

```

##### Dockerfile (Web)

File `Dockerfile` in build path `./web/Dockerfile`.

```dockerfile
FROM pitchanon/docker-apache-php:5.5

...

ADD sites-enabled/vhost.conf /etc/apache2/sites-enabled/
CMD ["/run.sh"]
```

##### VHost

Path vhost `./web/sites-enabled/vhost.conf`.

```
<VirtualHost *:80>
ServerName test-docker.dev
ServerAlias www.test-docker.dev

DocumentRoot /var/www/html
#SetEnv ENVIRONMENT "docker"
    <Directory /var/www/html>
        Options Indexes FollowSymLinks MultiViews
        AllowOverride All
        Order allow,deny
        allow from all
    </Directory>
</VirtualHost>
```

## Demo

### Run

Look in `demo` folder.

```sh
$ cd demo/docker/
$ sh start_server.sh
```

### Result

* Web: [http://192.168.99.100:9991/]
* phpMyAdmin: [http://192.168.99.100:32991/]
    - Username: root
    - Password: 123456
* MySQL
    - Username: root
    - Password: 123456
    - MySQL version

      ```sh
      $ docker exec -it test_mysql /bin/bash -c "mysql -V"
      ```

      > mysql  Ver 14.14 Distrib 5.5.49, for Linux (x86_64) using readline 5.1

## Environment variables summary

* ``ENVIRONMENT`` - define environment variable

## Documents

* [Documents]
* [Mongo PHP extensions install]
* [Phalcon PHP extensions install]

## Contact

Email: Pitchanon.d@gmail.com

[http://192.168.99.100:9991/]: http://192.168.99.100:9991/
[http://192.168.99.100:32991/]: http://192.168.99.100:32991/
[Docker Hub]: https://hub.docker.com/r/pitchanon/docker-apache-php/
[Documents]: https://github.com/Pitchanon/docker-apache-php/tree/master/docs
[Mongo PHP extensions install]: https://github.com/Pitchanon/docker-apache-php/blob/master/docs/Mongo-PHP-driver-install.md
[Phalcon PHP extensions install]: https://github.com/Pitchanon/docker-apache-php/blob/master/docs/phalcon-php-install.md
