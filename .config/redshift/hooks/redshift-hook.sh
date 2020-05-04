#!/usr/bin/sh

case $1 in
    period-changed)
        notify-send "Redshift" "Period changed to $3"
esac
