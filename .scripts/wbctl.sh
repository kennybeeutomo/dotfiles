#!/usr/bin/env bash
# Waybar control script

case $1 in
	togglehide )
		killall -SIGUSR1 waybar
		;;
	toggle )
		killall -q waybar || waybar &> /dev/null &
		;;
	reload )
		killall waybar
		waybar &> /dev/null &
		;;
	* ) exit 1;;
esac
