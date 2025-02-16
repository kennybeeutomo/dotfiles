#!/usr/bin/zsh
# Script to change alacritty opacity

configDir="$HOME/.config/alacritty"
configFile="$configDir/alacritty.toml"
opacityFile="$configDir/alacritty-opacity.toml"
newOpacity=$(cat "$opacityFile" | tomlq '.window.opacity')

default=0.8
step=${2:-0.1}

case $1 in
	increase ) newOpacity+="+$step";;
	decrease ) newOpacity+="-$step";;
	assign ) newOpacity=$step;;
	reset ) newOpacity=$default;;
	* ) exit 1;;
esac

newOpacity=$(printf "%.1f" "$(($newOpacity))")

[[ $newOpacity -gt 1 ]] && newOpacity=1
[[ $newOpacity -lt 0 ]] && newOpacity=0

tomlq -i -t ".window.opacity = $newOpacity" "$opacityFile" || exit 1
touch "$configFile"
