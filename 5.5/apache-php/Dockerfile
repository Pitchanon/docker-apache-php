FROM pitchanon/docker-apache-php:php-5.5

MAINTAINER Pitchanon D <Pitchanon.d@gmail.com>

# Install base packages
RUN export DEBIAN_FRONTEND="noninteractive" && \
    apt-get update && \
    apt-get -yq upgrade && \
    apt-get -yq install --no-install-recommends \
        apache2 \
        libapache2-mod-php5 && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/*

# Enable apache modules
RUN a2enmod headers php5 rewrite ssl vhost_alias

RUN rm -f /etc/apache2/sites-enabled/000-default.conf

ADD run.sh /run.sh

VOLUME ["/var/log/apache2"]

EXPOSE 80 443

#ADD sites-enabled/vhost.conf /etc/apache2/sites-enabled/
#CMD ["/run.sh"]

# grr, ENTRYPOINT resets CMD now
ENTRYPOINT ["/bin/bash"]

