FROM ubuntu:xenial

RUN apt-get update && apt-get install -y \
	qemu \
	uuid-runtime \
	sudo \
	python-pip \
	curl \
	parted \
	udev \
	kpartx \
	debootstrap \
	man \
	nano \
	git \
	&& pip install diskimage-builder

RUN mkdir -p /usr/local/build/image
COPY elements/remove-interfaced /usr/local/share/diskimage-builder/elements/remove-interfaced
COPY elements/chef /usr/local/share/diskimage-builder/elements/chef
WORKDIR /usr/local/build
