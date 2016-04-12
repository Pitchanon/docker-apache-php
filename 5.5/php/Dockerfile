FROM ubuntu:14.04

MAINTAINER Pitchanon D <Pitchanon.d@gmail.com>

ENV ENVIRONMENT=docker

# Install php and base packages
ENV DEBIAN_FRONTEND noninteractive
RUN export DEBIAN_FRONTEND="noninteractive"
RUN apt-get update
RUN apt-get -yq upgrade
RUN apt-get -yq install --no-install-recommends php5-cli php5-curl php5-gd php5-mcrypt php5-mysql php5-intl php5-json php5-pgsql php5-sqlite git curl zip unzip acl
RUN apt-get -y clean
RUN rm -rf /var/lib/apt/lists/*

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Enable mcrypt
RUN php5enmod mcrypt
