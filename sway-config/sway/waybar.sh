#!/bin/bash

killall waybar
sleep 0.5 
waybar -c ~/.config/sway/waybar/ &
