# Trigger udev rules
sudo udevadm trigger &

# Set background
feh --bg-scale ~/Backgrounds/99000X-07.png &

# Start programs
compton &
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
