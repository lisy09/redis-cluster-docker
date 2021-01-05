#!/bin/bash

set -x
docker push ${DOCKER_REPO}redis-cluster:${DOCKER_TAG} 
set +x