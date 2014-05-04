# Configure these:
DOCKER := "/usr/bin/docker.io"  # Using Ubuntu 14.04's docker.io package
BTSYNCWEBPORT := 8888
# End of user configuration.

IMAGE := syncweb
PWD := $(shell pwd)
RUNARGS := --rm -v ${PWD}/data:/btsync/data:rw -p ${BTSYNCWEBPORT}:8888

all:
	sudo ${DOCKER} build -t ${IMAGE} .

# inspect the image
debug:
	sudo ${DOCKER} run -t -i ${RUNARGS} ${IMAGE} bash
# ./btsync --nodaemon --config data/config.json

clean:
	sudo ${DOCKER} rmi ${IMAGE}



