#
# Copyright (C) 2026 Dorin Bombea
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/clockworkpi/uconsole-cm5

$(call inherit-product, vendor/brcm/rpi5/rpi5-vendor.mk)
$(call inherit-product, device/brcm/rpi5/device.mk)

## ALSA utils
#PRODUCT_PACKAGES += \
#    alsactl \
#    alsaloop \
#    alsamidi \
#    alsaucm \
#    amixer \
#    aplay \
#    arecord \
#    axfer \
#    iecset
#
## Raspberry Pi utils
#PRODUCT_PACKAGES += \
#    dtmerge \
#    dtoverlay \
#    pinctrl \
#    vcgencmd \
#    vclog \
#    vcmailbox
#
## TinyALSA utils
#PRODUCT_PACKAGES += \
#    tinycap2 \
#    tinymix2 \
#    tinypcminfo2 \
#    tinyplay2
#

## Replace health implementation from rpi5
PRODUCT_PACKAGES += \
    com.android.hardware.health.uconsole

## Replace audio implementation from rpi5
PRODUCT_PACKAGES += \
    com.android.hardware.audio.uconsole
