#!/bin/bash

docker run -ti -v /dev:/dev -v `pwd`/image:/usr/local/build/image -v `pwd`/cache:/cache --privileged kvm bash -c "source ./environment ; /usr/local/bin/disk-image-create -o image/debian debian vm devuser"
