#!/bin/bash

wallpaper=""
if [[ -n "$1" ]]; then
  wallpaper="$1"
else
  wallpaper=$(find ~/Pictures/Wallpapers/. \( -name "*.png" -o -name "*.jpg" \) | shuf -n1)
fi

echo "$wallpaper"
swaybg -i "$wallpaper" -m fill &

read -r -p "Copy over wallpaper.jpd? Y/N " set_wallpaper
if [[ "${set_wallpaper}" =~ ^[yY] ]]; then
  cp "$wallpaper" ~/.config/sway/wallpaper.jpg
fi
