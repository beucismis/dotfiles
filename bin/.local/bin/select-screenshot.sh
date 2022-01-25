#!/bin/bash
# Allow screenshot to be selected from cursor, then display shot image.

SCREENSHOT_DIR=$HOME/screenshots
mkdir -p $SCREENSHOT_DIR
sleep 0.2
scrot -s "$SCREENSHOT_DIR/%Y-%m-%d-%H%M%S_\$wx\$h.png"
notify-send "New screenshot!"