# Phalcon PHP extensions install

Install on PHP 5.5(PHP Version 5.5.9-1ubuntu4.14)

```dockerfile
RUN apt-get update && \
    apt-get install -y --force-yes php5-dev re2c make libpcre3-dev software-properties-common && \
    apt-add-repository ppa:phalcon/stable && \
    apt-get update && \
    apt-get install -y --force-yes --no-install-recommends \
        git-core \
        gcc \
        autoconf \
        php5-phalcon && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/*
```
