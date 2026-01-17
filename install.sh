#!/bin/bash
read -p "Install base? (y/N): " base
if [[ "$base" =~ ^[Yy]$ ]]; then
  sudo pacman -S curl xdg-user-dirs xdg-utils stow linux usbutils linux-firmware intel-ucode base base-devel git vim unzip unrar sudo networkmanager fakeroot cronie
fi

read -p "Install audio? (y/N): " audio
if [[ "$audio" =~ ^[Yy]$ ]]; then
  sudo pacman -S pipewire-alsa pipewire-docs pipewire-pulse pipewire pipewire-jack wireplumber
fi

read -p "Install dev apps? (y/N): " dev
if [[ "$dev" =~ ^[Yy]$ ]]; then
  sudo pacman -S neovim make cmake meson yazi npm python bear clang gcc gdb 
  stow -d configs -t ~ nvim
  stow -d configs -t ~ yazi
fi

read -p "Install intel gpu drivers? (y/N): " intelgpu 
if [[ "$intelgpu" =~ ^[Yy]$ ]]; then
  sudo pacman -S mesa vulkan-intel intel-media-driver linux-firmware-intel libva-intel-driver libvpl vpl-gpu-rt intel-media-sdk libva-utils vulkan-tools intel-compute-runtime intel-gpu-tools intel-graphics-compiler intel-oneapi-common lib32-vulkan-intel xf86-video-intel 
fi

read -p "Install hyprland and GUIs? (y/N): " hypr
if [[ "$hypr" =~ ^[Yy]$ ]]; then
    sudo pacman -S discord blueman pavucontrol qpwgraph wofi network-manager-applet waybar wl-clipboard grim slurp brightnessctl hypridle hyprland hyprpaper hyprlock hyprpolkitagent xdg-desktop-portal-hyprland
    stow -d configs -t ~ hypr
    stow -d configs -t ~ waybar
    stow -d configs -t ~ kanshi
fi

read -p "Install CUPS and GUI? (y/N): " cups
if [[ "$cups" =~ ^[Yy]$ ]]; then
    sudo pacman -S system-config-printer cups
fi

read -p "Install terms? (y/N): " terms
if [[ "$terms" =~ ^[Yy]$ ]]; then
    sudo pacman -S alacritty kitty ttf-hack-nerd
    stow -d configs -t ~ alacritty
    stow -d configs -t ~ kitty
fi

read -p "set defaults? (y/N): " defaults
if [[ "$defaults" =~ ^[Yy]$ ]]; then
	ln -s configs/mimeapps.list ~/.config/mimeapps.list
fi
