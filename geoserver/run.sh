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

#####

# echo "=======   Adresse IP du SGBD Postgres   =========="
# docker inspect  ${SERVER_PG_NAME} | grep "IPAddress" | cut -d: -f2 | cut -d, -f1| cut -d\" -f2

# echo "=======   Creation de la base de données Postgis entrepot avec insertion Geofla 2013 Communes France Métropolitaine (IGN) , ville de Cognac =========="
# docker run --link ${SERVER_PG_NAME}:db -ti -v /vagrant:/vagrant jamesbrink/postgresql sh -c 'exec psql -h "$DB_PORT_5432_TCP_ADDR" -p "$DB_PORT_5432_TCP_PORT" -U postgres  -f /vagrant/donnees_boot2geoportal/bd_postgis.sql'
