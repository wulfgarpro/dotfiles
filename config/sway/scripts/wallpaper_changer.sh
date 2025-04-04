#!/bin/bash
is_swaybg_ServerExist=$(ps -ef | grep -m 1 swaybg | grep -v "grep" | wc -l)
if [ "$is_swaybg_ServerExist" = "0" ]; then
  echo "swaybg_server not found" >/dev/null 2>&1
#	exit;
elif [ "$is_swaybg_ServerExist" = "1" ]; then
  killall swaybg
fi

wallpaper=$(find ~/Pictures/Wallpapers/. -name "*.png" | shuf -n1)
echo $wallpaper
swaybg -i $wallpaper -m fill &
read -r -p "Copy over wallpaper.png? Y/N " set_wallpaper
if [[ "${set_wallpaper}" =~ ^[yY] ]]; then
  cp $wallpaper ~/.config/sway/wallpaper.png
fi
