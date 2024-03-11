#
# ~/.bash_profile
#
export PATH=$PATH:$HOME/.local/bin
MOZ_ENABLE_WAYLAND=1

[[ -f ~/.bashrc ]] && . ~/.bashrc
if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec Hyprland
fi
