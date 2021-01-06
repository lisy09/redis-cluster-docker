#!/bin/bash

PARENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
ROOT_DIR="$( cd $PARENT_DIR/.. >/dev/null 2>&1 && pwd )"

set -x

docker run -it --rm \
    --network app \
    -v ${ROOT_DIR}/conf/app.yaml:/workspace/conf/app.yaml \
    ${DOCKER_REPO}python-base:${DOCKER_TAG} \
    python /workspace/src/main.py

set +x