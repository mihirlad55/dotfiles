# Trigger udev rules
sudo udevadm trigger &

# Set background
nitrogen --restore

# Start programs
compton -b --config ~/.config/compton.conf &
slack &
mailspring &
franz &
python3 ~/.submodules/install/polybar-spotify-controls/scripts/spotify/py_spotify_listener.py &
$(pkill polybar; sleep 4s && sh ~/.scripts/launch-polybar) &
xbindkeys &
redshift &
dunst &
ckb-next -b &
insync start &
insync show &
# Personal scripts
sh ~/.scripts/battery-check &

# Bind caps lock to escape
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape' &

# Autolock
xautolock -time 1 -locker ~/.scripts/lock &

# Disassociate terminal
disown
