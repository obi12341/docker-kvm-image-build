#!/bin/bash

docker build -t disk-image-create .

docker run -ti \
	-v /dev:/dev \
	-v `pwd`/images:/usr/local/build/image \
	-v `pwd`/cache:/cache \
	--privileged \
	--rm \
	--env-file ./environment \
	-e DIB_OFFLINE=1 \
	disk-image-create \
	bash -c "/usr/local/bin/disk-image-create --offline -o image/debian-`date +'%Y_%m_%d-%H_%M_%S'`-stable debian vm devuser cloud-init-nocloud remove-interfaced chef && cd image && ln -sf debian-`date +'%Y_%m_%d-%H_%M_%S'`-stable.qcow2 debian-current-stable.qcow2"
