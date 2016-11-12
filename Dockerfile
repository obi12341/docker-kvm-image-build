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
	&& pip install diskimage-builder

RUN mkdir -p /usr/local/build/image
WORKDIR /usr/local/build
COPY environment environment

