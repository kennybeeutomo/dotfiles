#!/usr/bin/env bash
# Waybar control script

# shellcheck disable=SC1090
source ~/.scripts/utils

layout=$(getoption waybar-config main.jsonc)

start-waybar() {
	waybar -c "$HOME/.config/waybar/layouts/$layout" &> /dev/null &
}

case $1 in
	togglehide )
		killall -SIGUSR1 waybar
		;;
	toggle )
		killall -q waybar || start-waybar
		;;
	reload )
		killall waybar
		start-waybar
		;;
	config )
		setoption 'waybar-config' "$2"
		wbctl.sh reload
		;;
	pick )
		# shellcheck disable=SC2012
		choice="$(ls ~/.config/waybar/layouts | vmenu -select "$layout" -p 'Waybar')"
		[ -n "$choice" ] && wbctl.sh config "$choice"
		;;
	* ) exit 1;;
esac
