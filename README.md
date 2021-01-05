# redis-cluster-docker

Origin: https://github.com/lisy09/redis-cluster-docker
This is a project to provide redis-cluster local/production environment with redis client example.

It is inspired by the [bitnami-docker-redis-cluster](https://github.com/bitnami/bitnami-docker-redis-cluster) project and add additional features.]

## Directory

- `build_scripts/`: scripts for building

## Change as you need

## How to build

### Prerequisite

- The environment for build needs to be linux/amd64 or macos/amd64
- The environemnt for build needs [docker engine installed](https://docs.docker.com/engine/install/)
- The environemnt for build needs GNU `make` > 3.8 installed

### Build command

To build all docker images locally:
```bash
make all
```

To push built docker images to the remote registry:
```bash
make push
```

To delete built local docker images:
```bash
make clean
```

Or you can check `./Makefile` for more details.

## How to run

### Prerequisite

- build based on the above section
- have [docker-compose](https://docs.docker.com/compose/install/) installed

### Run command

```bash
make run
```