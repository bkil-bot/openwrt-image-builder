FROM bkil/openwrt-image-generator-base
MAINTAINER github.com/bkil

WORKDIR /tmp/image-builder

RUN \
 make image \
 PROFILE=tl-wr740n-v1 \
 PACKAGES=" \
  kmod-ipt-ipopt iptables-mod-ipopt luci \
  "

ENTRYPOINT \
 cp -avt \
  /host \
  bin/*/*/*/*-squashfs-*.bin
