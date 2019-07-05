# Trigger udev rules
sudo udevadm trigger &

# Set background
nitrogen --restore

# Start programs
compton -b --config ~/.config/compton.conf &
slack &
mailspring &
station &
lightscreen &
sh ~/install/polybar-spotify-controls/scripts/spotify/launchlistener.sh &
sh ~/install/launch-polybar.sh &
xbindkeys &
redshift &
dunst &
insync start &
insync show &

# Disassociate terminal
disown
