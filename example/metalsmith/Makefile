# Configure these:
DOCKER := "/usr/bin/docker.io"  # Using Ubuntu 14.04's docker.io package
HTTPPORT := 8082
# End of user configuration.

IMAGE := srid/metalsmith
COMPUTER_NAME := "docker-metalsmith"
PWD := $(shell pwd)
RUNARGS := -v ${PWD}/data:/data:rw -p ${HTTPPORT}:80 -h ${COMPUTER_NAME}

all:
	sudo ${DOCKER} build -t ${IMAGE} .

run:	stop
	sudo ${DOCKER} run -d --name metalsmith_run ${RUNARGS} ${IMAGE}
	sudo ${DOCKER} logs -f metalsmith_run
stop:
	sudo ${DOCKER} kill metalsmith_run || true
	sudo ${DOCKER} rm -v metalsmith_run || true

# inspect the image
shell:
	sudo ${DOCKER} run --rm --name metalsmith_shell -t -i ${RUNARGS} ${IMAGE} bash


clean:
	sudo ${DOCKER} rmi ${IMAGE}

clean_data:
	sudo rm -rf ./data
	mkdir data
	touch data/.gitkeep
