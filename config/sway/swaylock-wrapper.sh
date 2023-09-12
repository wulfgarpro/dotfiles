#!/usr/bin/env bash

set -euo pipefail

wallpaper="$HOME/Pictures/Bing/wallpaper.jpg"

# Lock screen with the current wallpaper.
swaylock -f -i "$wallpaper"
