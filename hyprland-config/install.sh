#!/bin/bash

apps="stow wofi waybar qt5-wayland qt6-wayland nwg-look nwg-displays wl-clipboard grim slurp brightnessctl hyprgraphics hypridle hyprland hyprland-protocols hyprland-qt-support hyprland-qtutils hyprlock hyprpolkitagent hyprsunset hyprutils hyprwayland-scanner xdg-desktop-portal-hyprland"
configapps=(wofi hypr waybar)

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
