#!/usr/bin/bash

export SUDO_ASKPASS="$HOME/.scripts/rofi/rofi-askpass"

sudo --askpass mount --bind ~/Videos/ /srv/smb/
sudo --askpass systemctl start smb.service
