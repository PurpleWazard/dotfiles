#!/bin/bash
TOGGLE_FILE="/tmp/polybar_toggle"

if [ -f "$TOGGLE_FILE" ]; then
    rm "$TOGGLE_FILE"
else
    touch "$TOGGLE_FILE"
fi

# Immediately refresh the module via IPC.
polybar-msg action "#toggletext.hook.0"

