#!/usr/bin/env bash
# Rofi script to edit config files

EDITOR=${EDITOR:-nvim}

cmd="$EDITOR"
terminal=alacritty

configFiles=(
	'uwsm'
	'nvim'
	'environment'
	'aliases'
	'hyprland'
	'alacritty'
	'yazi'
	'rofi'
	'waybar'
	'zsh'
	'scripts'
	'todo'
	'desktop entries'
	'mimeapps'
)

configFile=$(IFS=';'; echo "${configFiles[*]}" | rofi -dmenu -sep ';' -p 'Edit')

case $configFile in
	'uwsm' )
		args=" $HOME/.config/uwsm/env"
		;;
	'environment' )
		cmd="sudo -E $cmd"
		args=" /etc/environment"
		;;
	'aliases' )
		args=" $HOME/.scripts/aliases"
		;;
	'hyprland' )
		args=" $HOME/.config/hypr"
		;;
	'nvim' )
		args=" $HOME/.config/nvim"
		;;
	'alacritty' )
		args=" $HOME/.config/alacritty/alacritty.toml"
		;;
	'yazi' )
		args=" $HOME/.config/yazi"
		;;
	'rofi' )
		args=" $HOME/.config/rofi"
		;;
	'waybar' )
		args=" $HOME/.config/waybar"
		;;
	'zsh' )
		args=" $HOME/.config/zsh"
		;;
	'scripts' )
		args=" $HOME/.scripts"
		;;
	'todo' )
		cmd+=' -c '
		args="\"Neorg workspace todo\""
		;;
	'desktop entries' )
		args=" $HOME/.local/share/applications"
		;;
	'mimeapps' )
		args=" $HOME/.config/mimeapps.list"
		;;
	* )
		exit 1
		;;
esac

eval $terminal --title 'edit.sh' -e $cmd $args
