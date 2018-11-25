all:
	docker build --network=host --tag=bkil/openwrt-image-builder-740v1 .
	docker run -v $(PWD):/host -i -t --net=host bkil/openwrt-image-builder-740v1
