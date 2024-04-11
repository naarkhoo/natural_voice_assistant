# Makefile for building and running the Docker container

# Name of the Docker image
IMAGE_NAME=natural_voice_assistant

# Dockerfile location
DOCKERFILE=docker/Dockerfile

# Build the Docker image
build:
	docker build -f $(DOCKERFILE) -t $(IMAGE_NAME) .

# Run the Docker container in interactive mode with volume mounting
.PHONY: build interactive
interactive:
	docker run -it \
		-e PULSE_SERVER=host.docker.internal \
		--mount type=bind,source=/Users/alka/.config/pulse,target=/home/pulseaudio/.config/pulse \
		-v $(shell pwd):/usr/src/app \
		--rm $(IMAGE_NAME) \
		/bin/bash

run-pulseaudio-mac:
	/opt/local/bin/pulseaudio \
	--load=module-native-protocol-tcp \
	--load-module-esound-protocol-tcp \
	--exit-idle-time\=-1 \
	--verbose

#-v ~/.config/pulse:/home/pulseaudio/.config/pulse \
