#!/usr/bin/env bash
# Script to edit clipboard in nvim

clipboardDir="$HOME/clipboard"

[ -d "$clipboardDir" ] || mkdir "$clipboardDir"
file="$clipboardDir/$(date +'%Y-%m-%d-%H-%M-%S-%N')"
touch "$file"

wl-paste -n > "$file"
alacritty --class editClipboard -e nvim --cmd 'let g:minimal=v:true' "$file"

if [ -s "$file" ]; then
	wl-copy -n < "$file"
else
	rm "$file"
fi
