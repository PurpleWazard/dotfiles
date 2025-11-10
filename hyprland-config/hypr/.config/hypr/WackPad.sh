#!/bin/bash

killall kanshi
killall waybar
killall hyprpaper

sleep 1

hyprpaper&
waybar&
kanshi&
