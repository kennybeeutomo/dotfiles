#!/usr/bin/env bash
# Pywal Integration script to choose pywal backend with rofi

source ~/.scripts/utils

backend=$(getoption walbackend)
backends='wal colorz colorthief haishoku'

choice=$(echo "$backends" | vmenu -select "$backend" -sep ' ' -p "Pywal Backends")

[ -n "$choice" ] && setoption walbackend "$choice" && pywal auto
