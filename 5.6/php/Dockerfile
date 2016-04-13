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
RUN apt-get -y install php5 php5-mhash php5-mcrypt php5-curl php5-cli php5-mysql php5-gd php5-intl php5-xsl php5-bcmath
RUN apt-get -y clean
RUN rm -rf /var/lib/apt/lists/*

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer



