FROM bkil:openwrt-image-generator-base
MAINTAINER github.com/bkil

WORKDIR /tmp/image-builder

RUN \
 make image \
 PROFILE=TLMR3220 \
 PACKAGES=" \
  -ppp -kmod-ppp -kmod-pppox -kmod-pppoe -ppp-mod-pppoe \
  block-mount kmod-fs-ext4 kmod-usb-storage \
  luci \
  kmod-usbip kmod-usbip-server kmod-usbip-client \
  "
# You don't need to delete *ppp* if you don't need luci before extroot.
# usbip is also optional

ENTRYPOINT \
 cp -avt \
  /host \
  bin/*/*-squashfs-*.bin
