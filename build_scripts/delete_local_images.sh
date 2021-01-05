#!/bin/bash

docker rmi -f $(docker images | grep -e "^${DOCKER_REPO}redis-cluster" | awk '{print $3}')