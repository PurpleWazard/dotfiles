#!/bin/bash


appsconfig=(i3 picom polybar nitrogen rofi autorandr)

apps="xsel xclip xorg-xinit xorg i3-wm polybar rofi autorandr arandr picom nitrogen autotiling stow"

if [[ "$1" == "-R" ]]; then
    for app in "${appsconfig[@]}"; do
        stow -D ${app} -t ~/
    done

        sudo pacman -Rnsc ${apps}
fi


# My i3-WM Gruvbox Config

# - i3 - The X11 Window manager
# - picom - an x11 compositor
# - polybar - the bar
# - nitrogen - wallpaper setting with easy gui
# - autotiling - adds dynamic tiling 
# - rofi - launcher
# - autorandr - adds ability to dock and undock laptop and switch monitors
# - arandr - gui for setting monitors

sudo pacman -S ${apps}


for app in "${appsconfig[@]}"; do

    stow ${app} -t ~/

done

