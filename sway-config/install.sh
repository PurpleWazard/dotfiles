#!/bin/bash


apps="
      swaybg
      waybar
      kanshi
      mako
      rofi-wayland
      hyprpolkitagent
      xdg-desktop-portal-wlr
      xdg-desktop-portal

      stow
      ttf-hack-nerd
      nwg-look
      nwg-displays
      wl-clipboard
      grim
      slurp
      brightnessctl
      "

aurapps="
      grimshot-bin-sway
      swayfx-i3-style-fullscreen-2-git
      "

configapps=(sway waybar kanshi)

if [[ "$1" == "-R" ]]; then

    for app in "${configapps[@]}"; do
        stow -D ${app} -t ~/
    done
    sudo pacman -Rnsc ${apps} ${aurapps}

else

  yay -S --sudoloop ${aurapps}
  sudo pacman -S ${apps}
  
  for app in $configapps; do
      stow ${app} -t ~/
  done
fi
