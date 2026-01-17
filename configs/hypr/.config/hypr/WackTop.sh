#!/bin/bash

killall hyprpaper
killall waybar

sleep 1

waybar&
hyprpaper&
