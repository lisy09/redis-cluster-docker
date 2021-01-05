ifneq (,$(wildcard ./.env))
    include .env
    export
endif

BUILD_SCRIPTS_PATH = ./build_scripts

.PHONY: all
all: redis 

.PHONY: redis
redis:
	$(BUILD_SCRIPTS_PATH)/build_redis.sh

.PHONY: clean
clean:
	$(BUILD_SCRIPTS_PATH)/delete_local_images.sh

.PHONY: push
push:
	$(BUILD_SCRIPTS_PATH)/push_images.sh

.PHONY: deploy
deploy:
ifeq (,$(shell docker network ls -f name=app -q))
	@docker network create app
endif
	docker-compose --env-file .env -f docker-compose.yml up -d

.PHONY: undeploy
undeploy:
	docker-compose --env-file .env -f docker-compose.yml down
	docker network rm app