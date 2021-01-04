#!/bin/env python
from openrazer.client import DeviceManager

device_manager = DeviceManager()

viper = None
for device in device_manager.devices:
    print(device.name)
    
    if "Razer Viper Ultimate (Wireless)" == device.name:
        viper = device

if viper:
    if viper.is_charging or viper.battery_level == 0:
        show = ''
    else:
        show = "{}%".format(viper.battery_level)

    print("%s " % show)
