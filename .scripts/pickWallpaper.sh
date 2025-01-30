#!/usr/bin/env bash
# Pywal Integration script to choose wallpaper with rofi and pywal it

source ~/.scripts/functions

rofiConfig="$HOME/.config/rofi/config-vi.rasi"

prompt='Change Wallpaper'

case $1 in
	nopywal ) prompt+=' (No Pywal)';;
	justpywal ) prompt+=' (Just Pywal)';;
esac

dirs=$(ls ~/Pictures)

extraDirs=(
	"$2"
)

# TODO: exclude directories
excludedDirs=(
	'Icons'
	'rices'
	'Screenshots'
	'Upscayl'
)

for dir in $extraDirs; do
	dirs+="\n$dir"
done

chosenDir=$(echo -e "${dirs[@]}" | rofi -config $rofiConfig -dmenu -i -p "$prompt")
[ -z "$chosenDir" ] && echo 'No directory chosen' && exit 1
wallpaperDir=$(fd -a "$chosenDir" "$HOME/Pictures")

wallpaper=$(pickimg "$wallpaperDir")

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
