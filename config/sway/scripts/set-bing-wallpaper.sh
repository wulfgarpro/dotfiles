#!/usr/bin/env bash

set -euo pipefail

BASE_URL="https://www.bing.com"
ENDPOINT="HPImageArchive.aspx?format=js&idx=0&n=1&mkt=en-US"
WALLPAPER_DIR="$HOME/Pictures/Bing"
LAST_URL_FILE="$WALLPAPER_DIR/last_url.txt"

mkdir -p "$WALLPAPER_DIR"

LAST_URL=""
[ -f "$LAST_URL_FILE" ] && LAST_URL=$(<"$LAST_URL_FILE")

IMAGE_PATH=$(curl -s "$BASE_URL/$ENDPOINT" | jq -r '.images[0].url')
FULL_URL="$BASE_URL$IMAGE_PATH"

if [[ "$LAST_URL" != "$FULL_URL" ]]; then
  wget -q -O "$WALLPAPER_DIR/wallpaper.jpg" "$FULL_URL"
  echo "$FULL_URL" >"$LAST_URL_FILE"
fi

swaymsg "output * bg $WALLPAPER_DIR/wallpaper.jpg fill" >/dev/null

# Return the path to the wallpaper.
echo "$WALLPAPER_DIR/wallpaper.jpg"
