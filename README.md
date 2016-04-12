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

ADD vhost.conf /etc/apache2/sites-enabled/

CMD ["/run.sh"]

```

### Running

```
docker run -d -v /host/www:/app -p 80 pitchanon/docker-apache-php:latest
```
