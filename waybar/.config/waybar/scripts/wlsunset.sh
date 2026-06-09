#!/bin/bash

if pgrep -x "wlsunset" > /dev/null; then
    if [[ "$1" == "toggle" ]]; then
        pkill -x "wlsunset"
    else
        echo '{"text": "[LF:  ON]", "class": "activated"}'
    fi
else
    if [[ "$1" == "toggle" ]]; then
        wlsunset -l 37.77426 -L 29.0876 &
    else
        echo '{"text": "[LF: OFF]", "class": "deactivated"}'
    fi
fi
