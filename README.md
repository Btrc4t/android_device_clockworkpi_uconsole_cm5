# AOSP 16 device tree configuration for ClockworkPi uConsole CM5

This device configuration is based on and depends on [raspberry-vanilla/android_device_brcm_rpi5](https://github.com/raspberry-vanilla/android_device_brcm_rpi5)

## Differences from rpi5
### HALs

Some HALs differ, these have their own folders here which match the folder
names found in the rpi5 device configuration

## `compare-and-link.sh` script
This script was used after copying and modifying HAL folders from rpi5  
Example of usage:
```
./compare-and-link.sh ~/Projects/Android16/device/brcm/rpi5/audio audio
```
It shows differences using `git diff` and asks for confirmation 
before linking identical files it finds  
The working directory for this example is the directory of this README.md
in an initialized AOSP16 repo
