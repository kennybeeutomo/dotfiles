#!/usr/bin/env bash
# Pywal Integration script to choose pywal saturation with rofi

source ~/.scripts/functions

rofiConfig="$HOME/.config/rofi/config-vi.rasi"

optionsDir=~/.scripts/options

currentSaturation=$(cat "$optionsDir/walsaturation")

saturations=$(for s in 0.{0..9} 1.0; do
                  echo -n $s
			      [ "$s" = "$currentSaturation" ] && echo -n ' *'
			      echo
			  done)

newSaturation=$(echo "$saturations" | rofi -x11 -dmenu -i -p 'Pywal Saturation')
[ -n "$newSaturation" ] && echo "$newSaturation" > $optionsDir/walsaturation && pywal "$(cat ~/.cache/wal/wal)"
