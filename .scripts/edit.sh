#!/usr/bin/env bash
# Rofi script to edit config files

# shellcheck disable=SC1090
source ~/.scripts/utils

declare -A configFiles=(
	['uwsm']="$HOME/.config/uwsm/env"
	['environment variables']="$HOME/.profile"
	['aliases']="$HOME/.scripts/aliases"
	['hyprland']="$HOME/.config/hypr"
	['nvim']="$HOME/.config/nvim"
	['alacritty']="$HOME/.config/alacritty/alacritty.toml"
	['yazi']="$HOME/.config/yazi"
	['rofi']="$HOME/.config/rofi"
	['waybar']="$HOME/.config/waybar"
	['zsh']="$HOME/.config/zsh"
	['scripts']="$HOME/.scripts"
	['todo']="$HOME/neorg/todo/index.norg"
	['notes']="$HOME/neorg/notes/index.norg"
	['expenses']="$HOME/finance/expenses"
	['desktop entries']="$HOME/.local/share/applications"
	['mimeapps']="$HOME/.config/mimeapps.list"
)

configFile=$(IFS=';'; echo "${!configFiles[*]}" | rmenu -sep ';' -p 'Edit')

persistvim 'edit.sh' "${configFiles[$configFile]}"
