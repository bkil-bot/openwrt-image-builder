FROM ubuntu:xenial
MAINTAINER github.com/bkil

ENV DEBIAN_FRONTEND noninteractive
ENV DIR "OpenWrt-ImageBuilder-15.05.1-ar71xx-generic.Linux-x86_64"
ENV TARBALL "$DIR.tar.bz2"
ENV TMP /tmp

WORKDIR "$TMP"

RUN \
 apt-get update && \
 apt-get -y upgrade

RUN \
 apt-get install -fy --no-install-recommends  \
 ca-cacert subversion build-essential libncurses5-dev zlib1g-dev \
 gawk git ccache gettext libssl-dev xsltproc wget && \
 rm -rf /var/lib/apt/lists/*

RUN \
 wget \
  -nv \
  https://downloads.openwrt.org/chaos_calmer/15.05.1/ar71xx/generic/$TARBALL && \
 tar -xjf $TARBALL && \
 rm $TARBALL

WORKDIR "$TMP/$DIR"

RUN \
 make image \
 PROFILE=TLMR3220 \
 PACKAGES=" \
  -ppp -kmod-ppp -kmod-pppox -kmod-pppoe -ppp-mod-pppoe \
  luci \
  block-mount kmod-usb-storage kmod-fs-ext4 \
  kmod-usbip kmod-usbip-server kmod-usbip-client \
  "
# You don't need to delete *ppp* if you don't need luci before extroot.

ENTRYPOINT \
 cp -avt \
  /host \
  bin/*/*-squashfs-*.bin
