# Helper and Convenient Scripts

The following scripts are available:

- **alsamixer**: Shortcut to launching alsamixer in st.

    Requirements: `alsa-utils`

- **big-message**: Launches chromium in app mode to display big ass message.

    Requirements: `chromium`

- **connect-to-poly-guest.py**: Auto-connects to Poly\_Guest.

    Requirements: `python3`

    Python Requirements: `requests`


- **dunst**: Collection of scripts for dunst

    Requirements: `dunst`

    - **battery-check**: runs in the background and notifies the user when the
    battery is plugged in, battery is low, and battery is full.

        Requirements: `acpi`

    - **alert**: Executed by dunst to play alert.wav when notifications are
    sent

        Requirements: `sox`

    - **update-notification**: Sends notification showing available system and
    AUR updates since last sync. Depends on root crontab syncing pacman
    periodically.

        Requirements: `yay`


- **connect-to-spotify**: Connects to bluetooth speaker and starts and resumes
spotify.

    Requirements: `bluetooth spotify playerctl`

- **get-weather**: Gets temperature and icon from openweathermap using API key.

    Requirements: `weathericons`

    Weather Icons can be found at https://github.com/erikflowers/weather-icons.

- **lock**: Locks screen using betterlockscreen and physlock.

    Requirements: `betterlockscreen physlock`

- **map-touch-to-screen**: Maps touchscreen and stylus to a particular monitor.

    Requirements: `xorg-xinput xorg-xrandr`


- **polybar**: Collection of polybar scripts

    Requirements: `polybar`

    - **launch-polybar**: Kills any running polybar instances, cleans up polybar temp ipc queues and relaunches polybar for each monitor.

    - **restart-polybar**: Kills any running polybar instances and executes
    launch-polybar script.

    - **reload-polybar**: Sends message to polybar-msg to reload polybar. 


- **rofi**: Collection of rofi scripts.
    
    Requirements: `rofi`

    - **drun**: Desktop application launcher.

    - **powermenu**: Power option menu

        Dependency Scripts: `lock`

    - **rofi-finder**: Searches all files in relavent directories in `$HOME`.

        Requirements: `xdg-utils`

    - **rofi-lastpass**: Password selector using rofi.

        Requirements: `lastpass-cli xclip xdotool`

    - **rofi-qalc**: Rofi calculator

        Requirements: `libqalculate rofi-calc`

    - **rofi-run**: Rofi command launcher

    - **rofi-scripts**: Rofi script selector from `~/.scripts`
    

- **resume-spotify**: Launch and resume spotify.

    Requirements: `spotify dbus`

- **screen-share**: Streams a particular monitor in VLC, so that only that
monitor is shared. Rofi can be used to select monitor.

    Optional Packages: `rofi`

- **screenshot-region**: Captures a selected region and saves it in 
`~/Documents/Screenshots` and copies it to the clipboard.

    Requirements: `xclip scrot libnotify`

- **start-screen-capture**: Start recording monitor using ffmpeg. A
notification alerts the user about the start of capture.

    Requirements: `ffmpeg libnotify`

- **stop-screen-capture**: Stop any instances of ffmpeg recording the monitor.
A notification alerts the user where the video is saved.
    
    Requirements: `ffmpeg libnotify`

- **virtual-4-screen**: Splits up the screen into 4 virtual monitors.

    Requirements: `xorg-xrandr`
