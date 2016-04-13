FROM pitchanon/docker-apache-php:php-5.6

MAINTAINER Pitchanon D <Pitchanon.d@gmail.com>

# Install base packages
RUN export DEBIAN_FRONTEND="noninteractive" && \
    apt-get update && \
    apt-get -yq --force-yes upgrade && \
    apt-get -yq --force-yes install --no-install-recommends \
        apache2 && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/*

RUN sed -i "s/variables_order.*/variables_order = \"EGPCS\"/g" /etc/php5/apache2/php.ini

# Enable apache modules
RUN a2dismod mpm_event && \
    a2enmod mpm_prefork rewrite vhost_alias headers ssl php5

RUN rm -f /etc/apache2/sites-enabled/000-default.conf

ADD run.sh /run.sh

VOLUME ["/var/log/apache2"]

EXPOSE 80 443

#ADD sites-enabled/vhost.conf /etc/apache2/sites-enabled/
#CMD ["/run.sh"]

# grr, ENTRYPOINT resets CMD now
ENTRYPOINT ["/bin/bash"]

