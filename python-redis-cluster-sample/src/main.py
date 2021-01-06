from rediscluster import RedisCluster
from functools import lru_cache
import yaml

@lru_cache()
def get_config():
    with open("/workspace/conf/app.yaml",'r') as stream:
        config = yaml.safe_load(stream)
    return config

if __name__ == "__main__":
    conf = get_config()
    redisNodes = conf["redisNodes"]
    startupNodes = []
    for node in redisNodes:
        parts = str(node).split(":")
        startupNodes.append({
            "host": parts[0],
            "port": parts[1]
        })

    rc = RedisCluster(
        startup_nodes=startupNodes
    )
    print(rc.connection_pool.nodes.nodes)
    print(rc.ping())
    print(rc.set('foo', 'bar'))
    print(rc.get('foo'))