#!/usr/bin/bash

if pgrep '^polybar' > /dev/null; then
  exit 0
fi

# Export path to Core 0 for temperature module
for path in /sys/class/hwmon/hwmon*/temp*_label; do
    label="$(cat "$path")"

    if [[ "$label" == "Core 0" ]]; then
        export HWMON_PATH="${path%_label}_input"
    fi
done

export BACKLIGHT_CARD="$(ls /sys/class/backlight | head -n1)"

# Remove old IPC
rm -rf /tmp/polybar_mqueue.*

# Launch per monitor
for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload main &
done
