#!/bin/bash

configapps=(nvim alacritty fish)
apps="alacritty fish curl npm base base-devel vkd3d vlc neovim vim vi unzip unrar ttf-hack-nerd sudo stow pipewire-alsa pipewire-docs pipewire-pulse pipewire pipewire-jack wireplumber networkmanager nautilus make luarocks kitty gvfs-smb git fakeroot cronie"

		
if [[ "$1" == "-R" ]]; then
	for app in "${appsconfig[@]}"; do
		stow -D ${app} -t ~/
	done

        sudo pacman -Rnsc ${apps}
else 


	sudo pacman -S ${apps}


	for app in "${appsconfig[@]}"; do

	    stow ${app} -t ~/


	done
fi




