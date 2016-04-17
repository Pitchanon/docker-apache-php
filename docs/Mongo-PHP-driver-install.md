# Mongo PHP driver install

```dockerfile
RUN apt-get update && \
    apt-get install -y php-pear php5-dev && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/*
    
#Mongo PHP driver version
ENV MONGO_VERSION 2.2.7
ENV MONGO_PGP 2.2
ENV MONGO_PHP_VERSION 1.5.5

RUN curl -SL --insecure "https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-$MONGO_VERSION.tgz" -o mongo.tgz \
    && curl -SL --insecure "https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-$MONGO_VERSION.tgz.sig" -o mongo.tgz.sig \
    && curl -SL --insecure "https://www.mongodb.org/static/pgp/server-$MONGO_PGP.asc" -o server-$MONGO_PGP.asc \
    && gpg --import server-$MONGO_PGP.asc \
    && gpg --verify mongo.tgz.sig \
    && tar -xvf mongo.tgz -C /usr/local --strip-components=1 \
    && rm mongo.tgz*

RUN pecl install mongo-$MONGO_PHP_VERSION && \
    mkdir -p /etc/php5/mods-available && \
    echo "extension=mongo.so" > /etc/php5/mods-available/mongo.ini && \
    ln -s /etc/php5/mods-available/mongo.ini /etc/php5/cli/conf.d/mongo.ini && \
    ln -s /etc/php5/mods-available/mongo.ini /etc/php5/apache2/conf.d/mongo.ini
```
