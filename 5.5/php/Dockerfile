FROM ubuntu:14.04

MAINTAINER Pitchanon D <Pitchanon.d@gmail.com>

#ENV ENVIRONMENT=docker
ENV ENVIRONMENT=${ENVIRONMENT}

# Install php and base packages
ENV DEBIAN_FRONTEND noninteractive
RUN export DEBIAN_FRONTEND="noninteractive" && \
    apt-get update && \
    apt-get -yq upgrade && \
    apt-get -yq install --no-install-recommends \
    php5-cli \
    php5-curl \
    php5-gd \
    php5-mcrypt \
    php5-mysql \
    php5-intl \
    php5-json \
    php5-pgsql \
    php5-sqlite \
    git curl zip unzip acl
RUN apt-get -y clean
RUN rm -rf /var/lib/apt/lists/*

# Enable mcrypt
RUN php5enmod mcrypt
