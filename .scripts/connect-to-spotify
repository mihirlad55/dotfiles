#!/usr/bin/sh

MAC=C0:28:8D:71:62:FD

pkill spotify
bluetoothctl power on
bluetoothctl disconnect $MAC 
bluetoothctl connect $MAC
spotify &
playerctl play
disown
