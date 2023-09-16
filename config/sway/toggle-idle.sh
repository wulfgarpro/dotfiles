#!/usr/bin/env bash
set -euo pipefail
# Toggle `swayidle` on/off. Run this when  you don't want `swayidle` to run,
# e.g. suspend when streaming video in browser.

SWAYIDLE_PID=$(pgrep -f swayidle)
FLAG_FILE="/tmp/swayidle_paused"

if [ -z "$SWAYIDLE_PID" ]; then
  echo "swayidle is not running."
  exit 1
fi

if [ -f "$FLAG_FILE" ]; then
  kill -s SIGCONT $SWAYIDLE_PID
  rm -f "$FLAG_FILE"
else
  kill -s SIGSTOP $SWAYIDLE_PID
  touch "$FLAG_FILE"
fi
