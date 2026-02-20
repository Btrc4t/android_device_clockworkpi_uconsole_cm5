#
# Copyright (C) 2026 Dorin
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit rpi5 device configuration
$(call inherit-product, device/brcm/rpi5/aosp_rpi5.mk)
# Inherit device configuration
$(call inherit-product, device/clockworkpi/uconsole-cm5/device.mk)


DEVICE_PATH := device/clockworkpi/uconsole-cm5

# Device identifier. This must come after all inclusions.
PRODUCT_DEVICE := uconsole-cm5
PRODUCT_NAME := uconsole_cm5
PRODUCT_BRAND := ClockworkPi
PRODUCT_MODEL := uConsole CM5
PRODUCT_MANUFACTURER := ClockworkPi
