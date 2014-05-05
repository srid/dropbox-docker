# Configure these:
DOCKER := "/usr/bin/docker.io"  # Using Ubuntu 14.04's docker.io package
HTTPPORT := 8080
# End of user configuration.

IMAGE := syncweb
PWD := $(shell pwd)
RUNARGS := -v ${PWD}/data:/data:rw -p ${HTTPPORT}:80

all:
	sudo ${DOCKER} build -t ${IMAGE} .

run:
	sudo ${DOCKER} run -d --name syncweb_run ${RUNARGS} ${IMAGE}
	sudo ${DOCKER} logs -f syncweb_run
stop:
	sudo ${DOCKER} kill syncweb_run || true
	sudo ${DOCKER} rm -v syncweb_run || true

# inspect the image
shell:
	sudo ${DOCKER} run --rm --name syncweb_shell -t -i ${RUNARGS} ${IMAGE} bash


clean:
	sudo ${DOCKER} rmi ${IMAGE}



