#!/usr/bin/sh

BASE_DIR="$( readlink -f "$(dirname "$0")" )"
ICON_PATH="$BASE_DIR/nightmode.png"

case $1 in
    period-changed)
        notify-send "Redshift" "Period changed to $3" -i "$ICON_PATH" -u normal
        echo "$3" > /tmp/.redshift-period
        ;;
esac
