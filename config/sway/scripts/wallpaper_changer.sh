#!/bin/bash
wallpaper=$(find ~/Pictures/Wallpapers/. \( -name "*.png" -o -name "*.jpg" \) | shuf -n1)
echo "$wallpaper"
swaybg -i "$wallpaper" -m fill &
# read -r -p "Copy over wallpaper.png? Y/N " set_wallpaper
# if [[ "${set_wallpaper}" =~ ^[yY] ]]; then
#   cp $wallpaper ~/.config/sway/wallpaper.png
# fi
