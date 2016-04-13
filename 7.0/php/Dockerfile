FROM ubuntu:14.04

MAINTAINER Pitchanon D <Pitchanon.d@gmail.com>

ENV ENVIRONMENT=docker

# Install base packages
RUN export LANG=en_US.UTF-8
RUN export DEBIAN_FRONTEND="noninteractive"
RUN apt-get update
RUN apt-get -yq install software-properties-common
RUN apt-get -yq install python-software-properties
RUN add-apt-repository -y ppa:ondrej/php
RUN apt-get update
RUN apt-get -yq --force-yes install --no-install-recommends php7.0 php7.0-common php7.0-gd php7.0-mysql php7.0-mcrypt php7.0-curl php7.0-intl php7.0-xsl php7.0-mbstring php7.0-zip php7.0-bcmath php7.0-iconv git curl zip unzip acl
RUN apt-get -y clean
RUN rm -rf /var/lib/apt/lists/*

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

