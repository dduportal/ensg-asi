#!/bin/sh

DB_IMAGE_NAME="jamesbrink/postgresql:latest"
DB_SERVER_NAME="dbserver"
GEOS_IMAGE_NAME="eliotjordan/docker-geoserver:latest"
GEOS_SERVER_NAME="geoserver"

echo "== Trying to download docker images ..."
docker pull ${DB_IMAGE_NAME}
docker pull ${GEOS_IMAGE_NAME}

echo "== Killing all existing containers"
[ -z "$(docker ps -a -q)" ] || docker kill $(docker ps -a -q)
[ -z "$(docker ps -a -q)" ] || docker rm $(docker ps -a -q)

echo "== Launching postgreSQL+PostGIS and waiting a little bit ..."
docker run --name ${DB_SERVER_NAME} -p 5432:5432 -d ${DB_IMAGE_NAME}
sleep 5

echo "== Launching Geoserver and waiting a little bit ..."
docker run --name ${GEOS_SERVER_NAME} --link ${DB_SERVER_NAME}:postgis_db -p 8080:8080 -d ${GEOS_IMAGE_NAME}
sleep 5

exit 0
