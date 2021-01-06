#!/usr/bin/bash

# Virtual1: Application audio
# Virtual2.monitor: Virtual microphone (Application audio and my microphone)
# Application -> Virtual1 -> Headphone Speakers
# Headphone Microphone -> Virtual2
# Virtual1 -> Virtual2
# Virtual2 -> Discord

# Create null sink for application audio
pactl load-module module-null-sink sink_name=Virtual1

# Create null intermediary sink
pactl load-module module-null-sink sink_name=Virtual2

# Redirect microphone to virtual2 sink
pactl load-module module-loopback source=alsa_input.usb-Corsair_Corsair_VOID_PRO_Wireless_Gaming_Headset-00.mono-fallback sink=Virtual2

# Redirect Virtual1 to Virtual2
pactl load-module module-loopback source=Virtual1.monitor sink=Virtual2

# Redirect virtual1 sink to headphone speaker
pactl load-module module-loopback source=Virtual1.monitor sink=alsa_output.usb-Corsair_Corsair_VOID_PRO_Wireless_Gaming_Headset-00.analog-stereo

