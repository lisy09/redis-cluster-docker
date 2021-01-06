ifneq (,$(wildcard ./.env))
    include .env
    export
endif

ROOT_DIR=${PWD}
BUILD_SCRIPTS_PATH=${PWD}/build_scripts
RUN_SCRIPTS_PATH=${PWD}/run_scripts


.PHONY: clear-pycache
clear-pycache: 
	bash ${BUILD_SCRIPTS_PATH}/clear_pycache.sh

.PHONY: base
base: clear-pycache
	bash ${BUILD_SCRIPTS_PATH}/build_base.sh

.PHONY: deploy-redis
deploy-redis:
	cd .. && make deploy
	
.PHONY: undeploy-redis
undeploy-redis:
	cd .. && make undeploy

.PHONY: run
run:
	bash ${RUN_SCRIPTS_PATH}/run_sample.sh