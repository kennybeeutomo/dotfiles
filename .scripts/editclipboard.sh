#!/usr/bin/env bash
# Script to edit clipboard in nvim

tempDir='/tmp/clipboard'
[ -d "$tempDir" ] || mkdir "$tempDir"
file=$(mktemp --tmpdir=$tempDir)
wl-paste -n > "$file"
alacritty --class editClipboard -e ${EDITOR:nvim} "$file"
cat "$file" | wl-copy -n
