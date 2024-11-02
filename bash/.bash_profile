#
# ~/.bash_profile
#

#env varibles
export EDITOR=nvim
export VISUAL=nvim

# start hyprland on login
[[ -f ~/.bashrc ]] && . ~/.bashrc
if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec Hyprland
fi


# Created by `pipx` on 2024-05-15 03:49:29
export PATH="$PATH:/home/wazard/.local/bin"
