#!/bin/bash

IMG_FILE=$(mktemp --suffix=.png)
REGION=$(slurp) || exit 1
grim -g "$REGION" "$IMG_FILE" || exit 1
TEXT=$(tesseract "$IMG_FILE" stdout)
rm "$IMG_FILE"
echo "$TEXT" | wl-copy

yad --title="OCR Result" \
    --width=500 --height=300 \
    --text-info --center \
    --wrap --fontname="monospace 10" \
    --button="Close":0 \
    --filename=<(echo "$TEXT")
