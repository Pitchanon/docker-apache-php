# docker apache php

- [Docker Hub](https://hub.docker.com/r/pitchanon/docker-apache-php/)

## Components

- Base: Ubuntu 14.04
- PHP 5.5 (tag: 5.5)
- PHP 5.6 (tag: 5.6)
- PHP 7.0 (tag: 5.7 or latest)
- PHP composer
- Apache 2.4 with mod_rewrite enabled

## Running & Building
### Using this container as a base
Use this container as a base for your application. Below is an example Dockerfile in which we add a VHost to the apache config:

```
FROM pitchanon/docker-apache-php:5.5
... OR ...
5.6, 7.0 or latest
```

```
ADD vhost.conf /etc/apache2/sites-enabled/

CMD ["/run.sh"]
```

### Running

```
docker run -d -v /host/www:/app -p 80 pitchanon/docker-apache-php:latest
```

### Docker Compose

In `docker-compose.yml` file

```
journal_web:
  build: web/
  ports:
    - 8006:80
  volumes:
    - ../www:/var/www/html
  container_name: journal-web
  links:
    - journal_db:mysql
  env_file:
    - ./env/docker.env # environment-specific

journal_pma:
  image: corbinu/docker-phpmyadmin
  ports:
    - 32006:80
  container_name: journal-phpmyadmin
  links:
    - journal_db:mysql
  env_file:
    - ./env/docker.env # environment-specific

journal_db:
  image: pitchanon/docker-mysql:5.5
  container_name: journal-mysql
  ports:
    - 33006:3306
  env_file:
    - ./env/docker.env # environment-specific
```

##### File `./env/docker.env`

```
#docker.env

ENVIRONMENT=docker

MYSQL_ROOT_PASSWORD=123456
MYSQL_PORT_3306_TCP_ADDR=192.168.99.100
MYSQL_PORT_3306_TCP_PORT=33006
```

##### File in build path `./web/Dockerfile`

```
FROM pitchanon/docker-apache-php:5.5

...

ADD sites-enabled/vhost.conf /etc/apache2/sites-enabled/
CMD ["/run.sh"]
```

##### VHost
Path vhost: `./web/sites-enabled/vhost.conf`

```
<VirtualHost *:80>
ServerName journal-egg.dev
ServerAlias www.journal-egg.dev

DocumentRoot /var/www/html
SetEnv ENVIRONMENT "docker"
    <Directory /var/www/html>
        Options Indexes FollowSymLinks MultiViews
        AllowOverride All
        Order allow,deny
        allow from all
    </Directory>
</VirtualHost>
```
