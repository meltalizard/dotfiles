#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"
CONFIG_FILE="$HOME/.config/hypr/hyprpaper.conf"
MONITOR="eDP-1"  # Change this if your monitor is named differently

selected=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) | sort | wofi --dmenu --prompt "Choose wallpaper" | tr -d '\n')

if [[ -n "$selected" && -f "$selected" ]]; then
    # Overwrite hyprpaper.conf with new wallpaper
    {
        echo "preload = $selected"
        echo "wallpaper = $MONITOR,$selected"
    } > "$CONFIG_FILE"

    # Restart hyprpaper
    pkill hyprpaper
    hyprpaper &
fi
