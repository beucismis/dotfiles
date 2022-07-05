#! /bin/sh

grim /tmp/tmp.png
ffmpeg -i /tmp/tmp.png -filter_complex "gblur=sigma=5" /tmp/lock-image.png -y