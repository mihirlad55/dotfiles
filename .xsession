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
insync start &
insync show &

# Disassociate terminal
disown
