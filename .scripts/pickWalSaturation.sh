#!/usr/bin/env bash
# Pywal Integration script to choose pywal saturation with rofi

source ~/.scripts/functions

rofiConfig="$HOME/.config/rofi/config-vi.rasi"

optionsDir=~/.scripts/options

echo 0.{0..9} 1.0 | rofi -dmenu -i -p 'Pywal Saturation' -sep ' ' > $optionsDir/walsaturation && pywal $(cat ~/.cache/wal/wal)
