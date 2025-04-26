#!/usr/bin/env bash

polybar-msg cmd quit
# killall polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar main

for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload example &
done
