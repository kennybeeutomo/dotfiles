#!/usr/bin/env bash
# Pywal Integration script to choose pywal backend with rofi

source ~/.scripts/functions

rofiConfig="$HOME/.config/rofi/config-vi.rasi"

optionsDir=~/.scripts/options
backend=$(cat $optionsDir/walbackend)
backends=(wal colorz colorthief haishoku)

for b in {0..4}; do
	[ ${backends[$b]} = $backend ] && backends[$b]+=' *'
done

IFS=';'
choice=$(echo -e "${backends[*]}" | rofi -config $rofiConfig -dmenu -sep ';' -i -p "Pywal Backends")

case $choice in
	wal )
		echo 'wal' > "$optionsDir/walbackend"
		;;
	colorz )
		echo 'colorz' > "$optionsDir/walbackend"
		;;
	colorthief )
		echo 'colorthief' > "$optionsDir/walbackend"
		;;
	haishoku )
		echo 'haishoku' > "$optionsDir/walbackend"
		;;
	* ) exit 1;;
esac

pywal $(cat ~/.cache/wal/wal)
