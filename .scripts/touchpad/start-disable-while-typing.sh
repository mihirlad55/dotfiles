#!/usr/bin/bash

touchpad_id="$(xinput \
  | grep 'Touchpad' \
  | grep -o -P 'id=[0-9]+' \
  | sed 's/id=//')"

prop_id="$(xinput list-props "$touchpad_id" \
  | grep -P 'libinput Disable While Typing Enabled \([0-9]+\):' \
  | grep -o -P '\([0-9]+\)' \
  | sed 's/[\(\)]//g')"

xinput set-prop "$touchpad_id" "$prop_id" 1
res="$?"

if [[ "$res" == 0 ]]; then
  notify-send "xinput" "Touchpad will be disabled while typing"
else
  notify-send "xinput" "Failed to start touchpad will be disabled while typing"
fi

