FROM ubuntu:14.04

MAINTAINER Pitchanon D <Pitchanon.d@gmail.com>

ENV ENVIRONMENT=docker

# Install base packages
RUN export LANG=en_US.UTF-8
RUN export DEBIAN_FRONTEND="noninteractive"
RUN apt-get update
RUN apt-get -yq install software-properties-common
RUN apt-get -yq install python-software-properties
RUN add-apt-repository -y ppa:ondrej/php5-5.6
RUN apt-get update
#RUN apt-get -yq install --no-install-recommends php5.6-cli php5.6-curl php5.6-gd php5.6-mcryp php5.6-mysql php5.6-intl php5.6-json php5.6-opcache php5.6-pgsql php5.6-sqlite3 git curl zip unzip acl
RUN apt-get -y --force-yes install --no-install-recommends php5 php5-mhash php5-mcrypt php5-curl php5-cli php5-mysql php5-gd php5-intl php5-xsl git curl zip unzip acl
RUN apt-get -y clean
RUN rm -rf /var/lib/apt/lists/*

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer



