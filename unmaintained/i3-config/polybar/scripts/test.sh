#!/bin/bash
TOGGLE_FILE="/tmp/polybar_battery_toggle"

while true; do
    if [ -f "$TOGGLE_FILE" ]; then
        echo "Alternate Battery Info"
    else
        echo "Normal Battery Info"
    fi
    sleep 1
done
