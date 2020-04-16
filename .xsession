# Trigger udev rules
sudo udevadm trigger &

# Set background
nitrogen --restore

# Start programs
compton -b --config ~/.config/compton.conf &
slack &
mailspring &
franz &
$(pkill polybar; sleep 4s && sh ~/.scripts/polybar/launch-polybar) &
xbindkeys &
redshift &
dunst &
ckb-next -b &
insync start &
insync show &

# Personal scripts
sh ~/.scripts/dunst/battery-check/battery-check &
sh ~/.scripts/dunst/update-notification &

# Bind caps lock to escape
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape' &

# Autolock
xautolock -time 1 -locker ~/.scripts/lock &

# Disassociate terminal
disown
