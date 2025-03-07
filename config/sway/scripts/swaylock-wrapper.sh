#!/usr/bin/env bash

set -euo pipefail

# Lock screen with the current wallpaper.
swaylock -f -i "$1"
