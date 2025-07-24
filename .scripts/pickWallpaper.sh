#!/usr/bin/env bash
# Pywal Integration script to choose wallpaper with rofi and pywal it

source ~/.scripts/utils

wallpaperDir="$HOME/Pictures/Wallpaper"

prompt='Change Wallpaper'

case $1 in
	nopywal ) prompt+=' (No Pywal)';;
	justpywal ) prompt+=' (Just Pywal)';;
esac

# shellcheck disable=SC2012
chosenDir=$(ls "$wallpaperDir" | vmenu -p "$prompt")

if ! cd "$wallpaperDir/$chosenDir"; then
	echo 'No directory chosen'
	exit 1
fi

wallpapers=$(find . -maxdepth 0)
wallpaper=$(pickimg "$wallpapers")

case $1 in
	'pywal' )
		chwal "$wallpaper"
		;;
	'nopywal' )
		swww-img "$wallpaper"
		;;
	'justpywal' )
		pywal "$wallpaper"
		;;
	* )
		exit 1
		;;
esac
