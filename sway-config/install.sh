#!/bin/bash

apps="stow rofi-wayland waybar qt5-wayland qt6-wayland nwg-look nwg-displays wl-clipboard grim slurp brightnessctl dunst kanshi"
configapps=(rofi sway waybar dunst kanshi)

if [[ "$1" == "-R" ]]; then

    for app in "${configapps[@]}"; do
        stow -D ${app} -t ~/
    done
    sudo pacman -Rnsc ${apps}
fi



sudo pacman -S ${apps}

for app in "${configapps[@]}"; do
    stow ${app} -t ~/
done
