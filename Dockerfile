FROM ubuntu:xenial
MAINTAINER github.com/bkil

ENV DEBIAN_FRONTEND noninteractive

WORKDIR /tmp

RUN \
 apt-get update && \
 apt-get -y upgrade

RUN \
 apt-get install -fy --no-install-recommends  \
 ca-cacert subversion build-essential libncurses5-dev zlib1g-dev \
 gawk git ccache gettext libssl-dev xsltproc wget && \
 rm -rf /var/lib/apt/lists/*

ENV TARBALL "OpenWrt-ImageBuilder-15.05.1-ar71xx-generic.Linux-x86_64.tar.bz2"

RUN \
 wget \
  -nv \
  https://downloads.openwrt.org/chaos_calmer/15.05.1/ar71xx/generic/$TARBALL && \
 tar -xjf $TARBALL && \
 rm $TARBALL && \
 mv *ImageBuilder* image-builder
