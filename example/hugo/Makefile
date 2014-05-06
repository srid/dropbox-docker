# Configure these:
DOCKER := "/usr/bin/docker.io"  # Using Ubuntu 14.04's docker.io package
HTTPPORT := 8081
# End of user configuration.

IMAGE := srid/hugo
COMPUTER_NAME := "docker-hugo"
PWD := $(shell pwd)
RUNARGS := -v ${PWD}/data:/data:rw -p ${HTTPPORT}:80 -h ${COMPUTER_NAME}

all:
	sudo ${DOCKER} build -t ${IMAGE} .

run:	stop
	sudo ${DOCKER} run -d --name hugo_run ${RUNARGS} ${IMAGE}
	sudo ${DOCKER} logs -f hugo_run
stop:
	sudo ${DOCKER} kill hugo_run || true
	sudo ${DOCKER} rm -v hugo_run || true

# inspect the image
shell:
	sudo ${DOCKER} run --rm --name hugo_shell -t -i ${RUNARGS} ${IMAGE} bash


clean:
	sudo ${DOCKER} rmi ${IMAGE}

clean_data:
	sudo rm -rf ./data
	mkdir data
	touch data/.gitkeep
