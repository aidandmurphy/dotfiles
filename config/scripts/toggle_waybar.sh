#!/bin/bash

# Check if Waybar is running
if pgrep -x "waybar" > /dev/null; then
    # Kill Waybar
    pkill -x waybar
    pkill -x swaync
    pkill -x swaync-client
else
    # Launch Waybar
    waybar &
    swaync &
    swaync-client -swb &
fi
