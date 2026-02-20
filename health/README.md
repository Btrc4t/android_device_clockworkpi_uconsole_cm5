
# Why this recompiled default implementation

This healthd implementation is the default implementation however
compiled in a way that replaces the `device/brcm/rpi5/health` implementation
This approach is taken because:

1. In AOSP, there is no way to remove from the inherited `rpi5` `PRODUCT_PACKAGES`
There is an interest to remove this product package:

```

# Health
PRODUCT_PACKAGES += \
    com.android.hardware.health.rpi5
```

but in `device/clockworkpi/uconsole-cm5/device.mk` there's no way to remove
`com.android.hardware.health.rpi5` from `PRODUCT_PACKAGES`
So we simply replace it's components in `Android.bp` here.

2. There is an interest to reuse as much as possible from `device/brcm/rpi5`, since differences are minimal
