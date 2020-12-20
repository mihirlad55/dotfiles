#!/usr/bin/bash

pkill chromium
pkill Discord
~/.scripts/lock disable
chromium --user-data-dir="$HOME/.config/chromium/Profile 1"
