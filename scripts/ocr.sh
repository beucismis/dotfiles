#!/bin/bash

IMG_FILE=$(mktemp --suffix=.png)
REGION=$(slurp) || exit 1
grim -g "$REGION" "$IMG_FILE" || exit 1
TEXT=$(tesseract "$IMG_FILE" stdout)
rm "$IMG_FILE"
echo "$TEXT" | wl-copy

yad --text-info --width=500 --height=300 --button="Close":0 --title="OCR Result" --filename=<(echo "$TEXT") --fontname="Iosevka Regular 10"
