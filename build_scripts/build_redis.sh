#!/bin/bash

PARENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
ROOT_DIR="$( cd $PARENT_DIR/.. >/dev/null 2>&1 && pwd )"

set -x

docker build \
    --build-arg REDIS_VERSION=${REDIS_VERSION} \
    --build-arg ORIGIN_REDIS_CONF_PATH=${ORIGIN_REDIS_CONF_PATH} \
    -t ${DOCKER_REPO}redis-cluster:${DOCKER_TAG} \
    ${ROOT_DIR}/redis-docker

set +x