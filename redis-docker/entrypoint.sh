#!/bin/bash

set -e

ORIGIN_REDIS_CONF_PATH=${ORIGIN_REDIS_CONF_PATH:-/usr/local/etc/redis.conf}
REDIS_CONF_PATH=/usr/local/etc/redis-generated.conf

if [ ! -z ${INIT_CLUSTER} ]; then
    /usr/local/bin/init_redis_cluster.sh
# allow the container to be started with `--user`
elif [ "$1" = 'redis-server' -a "$(id -u)" = '0' ]; then
    cp ${ORIGIN_REDIS_CONF_PATH} ${REDIS_CONF_PATH}
	sed -i 's/REDIS_PORT/'$REDIS_PORT'/g' ${REDIS_CONF_PATH}
	chown redis ${REDIS_CONF_PATH}
	exec gosu redis "redis-server" "${REDIS_CONF_PATH}"
fi

exec "$@"