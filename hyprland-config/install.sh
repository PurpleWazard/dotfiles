#!/bin/bash

apps="
    stow
    wofi
    waybar
    qt5-wayland
    qt6-wayland 
    nwg-look 
    nwg-displays
    wl-clipboard 
    grim 
    slurp
    brightnessctl
    hypridle 
    hyprland 
    hyprpaper
    hyprlock 
    hyprpolkitagent 
    xdg-desktop-portal-hyprland
    "

aurapps="
    hyprshot
"

configapps=(wofi hypr waybar)

if [[ "$1" == "-R" ]]; then

    for app in "${configapps[@]}"; do
        stow -D ${app} -t ~/
    done
    sudo pacman -Rnsc ${apps} ${aurapps}

else 

    sudo pacman -S ${apps}
    yay -S --sudoloop ${aurapps}

    for app in "${configapps[@]}"; do
        stow ${app} -t ~/
    done

fi
