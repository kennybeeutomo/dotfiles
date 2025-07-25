#!/usr/bin/env bash
# Pywal Integration script to choose pywal saturation with rofi

source ~/.scripts/utils

saturation=$(getoption walsaturation)
saturations=$(echo None 0.{0..9} 1.0)

choice=$(echo "$saturations" | vmenu -select "$saturation" -sep ' ' -p 'Pywal Saturation')

[ -n "$choice" ] && setoption walsaturation "$choice" && pywal auto
