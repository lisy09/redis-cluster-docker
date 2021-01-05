ARG REDIS_VERSION=6.0.9
FROM redis:${REDIS_VERSION}-buster

LABEL maintainer="lisy09.thu@gmail.com"

ARG ORIGIN_REDIS_CONF_PATH=/usr/local/etc/redis.conf
ENV ORIGIN_REDIS_CONF_PATH=${ORIGIN_REDIS_CONF_PATH}

COPY redis.conf ${ORIGIN_REDIS_CONF_PATH}
COPY entrypoint.sh /usr/local/bin/
COPY init_redis_cluster.sh /usr/local/bin/
RUN chmod a+x /usr/local/bin/entrypoint.sh \
    && chmod a+x /usr/local/bin/init_redis_cluster.sh

ENV REDIS_PORT 6379

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["redis-server"]