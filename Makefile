# Configure these:
DOCKER := "/usr/bin/docker.io"  # Using Ubuntu 14.04's docker.io package
BTSYNCWEBPORT := 8888
HTTPPORT := 8080
# End of user configuration.

IMAGE := syncweb
PWD := $(shell pwd)
RUNARGS := -v ${PWD}/data:/btsync/data:rw -p ${BTSYNCWEBPORT}:8888 -p ${HTTPPORT}:80

all:
	sudo ${DOCKER} build -t ${IMAGE} .

run:
	sudo ${DOCKER} run -d --name syncweb_run ${RUNARGS} ${IMAGE}
	sudo ${DOCKER} logs -f syncweb_run
stop:
	sudo ${DOCKER} kill syncweb_run || true
	sudo ${DOCKER} rm -v syncweb_run || true

# inspect the image
debug:
	sudo ${DOCKER} run --rm --name syncweb_debug -t -i ${RUNARGS} ${IMAGE} bash


clean:
	sudo ${DOCKER} rmi ${IMAGE}



