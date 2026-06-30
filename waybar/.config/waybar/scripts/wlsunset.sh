#!/bin/bash

if pgrep -x "wlsunset" > /dev/null; then
    if [[ "$1" == "toggle" ]]; then
        pkill -x "wlsunset"
    else
        echo '{"text": "LF:  ON", "class": "activated"}'
    fi
else
    if [[ "$1" == "toggle" ]]; then
        wlsunset -S 06:30 -s 19:30 -t 4000 -T 6500 &
    else
        echo '{"text": "LF: OFF", "class": "deactivated"}'
    fi
fi
