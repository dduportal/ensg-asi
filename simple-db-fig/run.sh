#!/bin/sh

# Load custom settings written by bootlocal.sh
source /home/docker/.profile

# clean
docker kill $(docker ps -a -q)
docker rm $(docker ps -a -q)

# start infra.
dfig up -d 
sleep 5

# Load data set
dfig run dbserver psql -h dbserver -p 5432 -U postgres -f /vagrant/simple-db/comptes.sql