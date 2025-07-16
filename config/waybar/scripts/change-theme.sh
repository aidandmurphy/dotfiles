#!/bin/bash

# Directory containing wallpapers
WALLPAPER_DIR="$HOME/Pictures/Wallpapers"
STATE_FILE="$HOME/.current_wallpaper_index"

# Load all wallpapers into array
mapfile -t WALLPAPERS < <(find "$WALLPAPER_DIR" -type f \( -iname '*.jpg' -o -iname '*.png' \) | sort)

# Check if any wallpapers were found
NUM_WALLPAPERS=${#WALLPAPERS[@]}
if [ "$NUM_WALLPAPERS" -eq 0 ]; then
    echo "No wallpapers found in $WALLPAPER_DIR"
    exit 1
fi

# Get next wallpaper index
if [ -f "$STATE_FILE" ]; then
    INDEX=$(<"$STATE_FILE")
    INDEX=$(( (INDEX + 1) % NUM_WALLPAPERS ))
else
    INDEX=0
fi

# Save the new index
echo "$INDEX" > "$STATE_FILE"
CURRENT_WALLPAPER="${WALLPAPERS[$INDEX]}"

# Start swww if not running
pgrep swww >/dev/null || swww init

# Change wallpaper with transition
swww img "$CURRENT_WALLPAPER" --transition-type fade --transition-duration 2

# Send a notification
notify-send -i "$CURRENT_WALLPAPER" "Wallpaper changed" "Now using: $(basename "$CURRENT_WALLPAPER")"
