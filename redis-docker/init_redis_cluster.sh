#!/bin/bash

dns_lookup() {
    local host="${1:?host is missing}"
    local ip_version="${2:-}"
    getent "ahosts${ip_version}" "$host" | awk '/STREAM/ {print $1 }' | head -n 1
}

set -e
set -x

IFS=',' read -a nodes <<< ${REDIS_NODES}
parsed_nodes=""
for node in "${nodes[@]}"; do
    IFS=':' read -a parts <<< ${node}
    if [ ! -z "${parsed_nodes}" ]; then
        parsed_nodes+=" "
    fi
    ip=("$(dns_lookup ${parts[0]})")
    parsed_nodes+="${ip}:${parts[1]}"
done

redis-cli --cluster create $parsed_nodes \
    --cluster-replicas ${CLUSTER_REPLICAS} \
    --cluster-yes