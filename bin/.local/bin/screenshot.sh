#!/bin/bash
# Take screenshot of entire screen (multi-head) and display shot.

SCREENSHOT_DIR=$HOME/screenshots
mkdir -p $SCREENSHOT_DIR
sleep 0.2
scrot -m "$SCREENSHOT_DIR/%Y-%m-%d-%H%M%S_\$wx\$h.png" -e "xdg-open \$f"
notify-send "New screenshot!"