#!/bin/sh -e

docker run -v $PWD:/host -i -t \
 --net=host \
 bkil/openwrt-image-generator

echo interactive: \
docker run -v $PWD:/host -i -t \
 --entrypoint /bin/bash \
 --net=host \
 bkil/openwrt-image-generator
