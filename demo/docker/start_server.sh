#!/bin/sh

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
echo $DIR

#docker rm -f $(docker ps -a)
docker rm -f test_web
docker rm -f test_phpmyadmin
docker rm -f test_mysql
docker-compose rm

docker-compose up -d test-db
docker-compose build test-web
docker-compose up -d test-web
docker-compose up -d test-pma
