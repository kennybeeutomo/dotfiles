#!/usr/bin/env bash
# Script to edit clipboard in nvim

clipboardDir="$HOME/clipboard"

[ -d "$clipboardDir" ] || mkdir "$clipboardDir"
file="$clipboardDir/$(date +'%Y-%m-%d-%H-%M-%S-%N')"
touch "$file"

wl-paste -n > "$file"
alacritty --class editClipboard -e "${EDITOR:-nvim}" "$file"
wl-copy -n < "$file"
