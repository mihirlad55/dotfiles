# Trigger udev rules
sudo udevadm trigger &

# Set background
nitrogen --restore

# Start programs
compton -b --config ~/.config/compton.conf &
slack &
mailspring &
franz &
lightscreen &
sh ~/.submodules/install/polybar-spotify-controls/scripts/spotify/launchlistener.sh &
sh ~/.submodules/install/launch-polybar.sh &
xbindkeys &
redshift &
dunst &
ckb-next -b &
insync start &
insync show &

# Bind caps lock to escape
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape' &

# Autolock
xautolock -time 5 -locker 'physlock -l && betterlockscreen --lock' &

# Disassociate terminal
disown
