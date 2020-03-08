#!/usr/bin/sh

charge_level=0
last_plugged_in=0

while true; do
    last_charge_level=$charge_level
    last_plugged_in=$plugged_in

    charge_level=$(acpi -b | cut -d' ' -f4 | egrep -o "[0-9]{2,3}") 

    acpi -a | grep 'on-line'
    if [ "$?" -eq 0 ]; then
        plugged_in=1
    else
        plugged_in=0
    fi

    if [ "$charge_level" -ne "$last_charge_level" ]; then
        if [ "$charge_level" -lt 10 ]; then
            notify-send "Battery Low" "Battery is currently at $charge_level%"
        elif [ "$charge_level" -eq 100 ]; then
            notify-send "Battery Full" "Battery is currently at $charge_level%"
        fi
    elif [ "$plugged_in" -eq 1 ]; then
        if [ "$plugged_in" -ne "$last_plugged_in" ]; then
            notify-send "Battery Charging" "Battery is currently at $charge_level%"
        fi
    fi
    sleep 5s
done


