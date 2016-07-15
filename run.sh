#!/bin/sh -e

mkdir -p data

docker run -v data:/data -i -t \
 --net=host \
 --name oib \
 bkil/openwrt-image-builder
