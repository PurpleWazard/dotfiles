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
    ttf-hack-nerd
    grim 
    slurp
    brightnessctl
    hypridle 
    hyprland 
    hyprpaper
    kanshi
    hyprlock 
    hyprpolkitagent 
    xdg-desktop-portal-hyprland
    "

aurapps="
    hyprshot
"

configapps=(wofi kanshi hypr waybar)

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
