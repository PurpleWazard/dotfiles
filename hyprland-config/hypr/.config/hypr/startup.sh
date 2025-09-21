#!/bin/bash
killall waybar
killall kanshi
killall hyprpaper

waybar&
kanshi&
hyprpaper&
