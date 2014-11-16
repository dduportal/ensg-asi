#!/bin/sh

IMAGE_NAME="jamesbrink/postgresql:latest"
SERVER_NAME="dbserver"

echo "== Trying to download docker image for ${IMAGE_NAME}..."
docker pull ${IMAGE_NAME}

echo "== Killing all existing containers"
docker kill $(docker ps -a -q)
docker rm $(docker ps -a -q)

echo "== Launching postgreSQL image and waiting 2 seconds ..."
docker run --name ${SERVER_NAME} -d ${IMAGE_NAME}
sleep 5

echo "== Running the sql script to create all objects"
docker run --link ${SERVER_NAME}:db -ti -v /vagrant:/vagrant ${IMAGE_NAME} sh -c 'exec psql -h "$DB_PORT_5432_TCP_ADDR" -p "$DB_PORT_5432_TCP_PORT" -U postgres -f /vagrant/simple-db/comptes.sql'