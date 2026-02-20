#
# Copyright (C) 2026 Dorin Bombea
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/clockworkpi/uconsole-cm5

$(call inherit-product, vendor/brcm/rpi5/rpi5-vendor.mk)
$(call inherit-product, device/brcm/rpi5/device.mk)
# Custom applications TODO remove until next TODO
$(call inherit-product, vendor/common/packages/applications/packages.mk)

# ALSA utils
PRODUCT_PACKAGES += \
    alsactl \
    alsaloop \
    alsamidi \
    alsaucm \
    amixer \
    aplay \
    arecord \
    axfer \
    iecset

# Raspberry Pi utils
PRODUCT_PACKAGES += \
    dtmerge \
    dtoverlay \
    pinctrl \
    vcgencmd \
    vclog \
    vcmailbox

# TinyALSA utils
PRODUCT_PACKAGES += \
    tinycap2 \
    tinymix2 \
    tinypcminfo2 \
    tinyplay2

# TODO remove until here

## Replace health implementation from rpi5
PRODUCT_PACKAGES += \
    com.android.hardware.health.uconsole

## Replace audio implementation from rpi5
PRODUCT_PACKAGES += \
    com.android.hardware.audio.uconsole

# All replacements from rpi5
LOCAL_OVERRIDES_PACKAGES := \
    com.android.hardware.audio.rpi5 \
    com.android.hardware.health.rpi5

