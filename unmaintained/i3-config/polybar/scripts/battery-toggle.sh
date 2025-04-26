#!/bin/bash
TOGGLE_FILE="/tmp/polybar_battery_toggle"

# Toggle the file existence
if [ -f "$TOGGLE_FILE" ]; then
    rm "$TOGGLE_FILE"
else
    touch "$TOGGLE_FILE"
fi

# Trigger Polybar to refresh the module
polybar-msg action "#battery.hook.0"

