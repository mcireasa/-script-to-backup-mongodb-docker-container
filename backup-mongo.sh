#!/bin/sh

export CONTAINER_NAME="mongodb"
export DATABASE_NAME="persons"
export BACKUP_LOCATION="/home/mcireasa/backup-docker-mongo"

export TIMESTAMP=$(date +'%Y%m%d%H%M%S')

docker exec -t ${CONTAINER_NAME} mongodump --gzip --out /backup/${DATABASE_NAME}-backup-${TIMESTAMP} --db ${DATABASE_NAME}
docker cp ${CONTAINER_NAME}:/backup/${DATABASE_NAME}-backup-${TIMESTAMP} ${BACKUP_LOCATION}
