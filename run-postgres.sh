#!/usr/bin/env bash

set -a
set -e
set -u

NET_NAME="$1"
DNS_IP="$2"
POSTGRES_PORT="$3"
POSTGRES_USER="$4"
POSTGRES_PASSWORD="$5"
RBAC_DOCKER_IMAGE_NAME="$6"
RBAC_DOCKER_VOLUME="$7"
RBAC_DOCKER_IMAGE_NAME="$8"
LOCAL_POSTGRES_PORT="$9"

# Run postgres_user
docker run  --name ${RBAC_DOCKER_IMAGE_NAME} --net ${NET_NAME} --dns ${DNS_IP} \
    -p ${LOCAL_POSTGRES_PORT}:${POSTGRES_PORT} -e POSTGRES_USER=${POSTGRES_USER} \
    -e POSTGRES_PASSWORD=${POSTGRES_PASSWORD} \
    -d --volumes-from ${RBAC_DOCKER_VOLUME} lerwys/docker-${RBAC_DOCKER_IMAGE_NAME}
