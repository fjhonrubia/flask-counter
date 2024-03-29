#!/bin/bash
docker build -t flask .
docker network create practice
docker run -d --name redis --network practice redis
docker run -d --name mysql -e MYSQL_ROOT_PASSWORD=password --network practica mysql
docker run -ti --rm -p 5000:5000 --network practice flask