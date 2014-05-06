# Configure these:
DOCKER := "/usr/bin/docker.io"  # Using Ubuntu 14.04's docker.io package
HTTPPORT := 8080
# End of user configuration.

IMAGE := srid/pelican
COMPUTER_NAME := "docker-pelican"
PWD := $(shell pwd)
RUNARGS := -v ${PWD}/data:/data:rw -p ${HTTPPORT}:80 -h ${COMPUTER_NAME}

all:
	sudo ${DOCKER} build -t ${IMAGE} .

run:	stop
	sudo ${DOCKER} run -d --name pelican_run ${RUNARGS} ${IMAGE}
	sudo ${DOCKER} logs -f pelican_run
stop:
	sudo ${DOCKER} kill pelican_run || true
	sudo ${DOCKER} rm -v pelican_run || true

# inspect the image
shell:
	sudo ${DOCKER} run --rm --name pelican_shell -t -i ${RUNARGS} ${IMAGE} bash


clean:
	sudo ${DOCKER} rmi ${IMAGE}

clean_data:
	sudo rm -rf ./data
	mkdir data
	touch data/.gitkeep
