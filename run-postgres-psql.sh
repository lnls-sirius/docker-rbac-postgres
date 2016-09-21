#!/usr/bin/env bash

set -a
set -e
set -u

SERVICE="$1"

. ./env-vars.sh ${SERVICE}

# Run postgres PSQL
docker run --name ${RBAC_DOCKER_IMAGE_NAME}-psql --net ${NET_NAME} --dns ${DNS_IP} \
    -e POSTGRES_USER=${POSTGRES_USER} \
    -e POSTGRES_PASSWORD=${POSTGRES_PASSWORD} \
    -it postgres psql -h docker-${RBAC_DOCKER_IMAGE_NAME} -U ${POSTGRES_USER}
