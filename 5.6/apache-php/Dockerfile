FROM ubuntu:14.04

MAINTAINER Pitchanon D <Pitchanon.d@gmail.com>

ENV ENVIRONMENT=docker

#Install php and dependenceis
ENV DEBIAN_FRONTEND noninteractive

# Install base packages
RUN export LANG=en_US.UTF-8 && \
    export DEBIAN_FRONTEND="noninteractive" && \
    apt-get update && \
    apt-get -yq upgrade && \
    apt-get -yq install python-software-properties && \
    add-apt-repository -y ppa:ondrej/php && \
    apt-get update && \
    apt-get -yq install --no-install-recommends \
        php5.6-cli \
        php5.6-curl \
        php5.6-gd \
        php5.6-mcryp \
        php5.6-mysql \
        php5.6-intl \
        php5.6-json \
        php5.6-opcache \
        php5.6-pgsql \
        php5.6-sqlite3 \
        git curl zip unzip acl && \
        apache2 libapache2-mod-php5.6 && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/*

RUN sed -i "s/variables_order.*/variables_order = \"EGPCS\"/g" /etc/php5.6/apache2/php.ini

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Enable apache modules
RUN a2dismod mpm_event && \
    a2enmod mpm_prefork rewrite vhost_alias headers ssl php5.6

RUN rm -f /etc/apache2/sites-enabled/000-default.conf

ADD run.sh /run.sh

VOLUME ["/var/log/apache2"]

EXPOSE 80 443

#ADD sites-enabled/vhost.conf /etc/apache2/sites-enabled/
#CMD ["/run.sh"]

# grr, ENTRYPOINT resets CMD now
ENTRYPOINT ["/bin/bash"]

