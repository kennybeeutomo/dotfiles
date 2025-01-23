#!/usr/bin/env bash
# Script taken and modified a bit from https://gist.github.com/CapMousse/454ec041880e78b4e3a894e7a4033faa
# Dependencies: tesseract-ocr imagemagick wl-clipboard

screenshot="$HOME/.scripts/screenshot.sh"

die() {
	hyprctl -q notify 3 3000 0 "$1"
	exit 1
}

cleanup() {
	[[ -n $1 ]] && rm -r "$1"
}

SCR_IMG=$(mktemp -d) || die "failed to create tmpdir"

# shellcheck disable=SC2064
trap "cleanup '$SCR_IMG'" EXIT

"$screenshot" selection "$SCR_IMG/scr.png" || die "Text extraction cancelled"
mogrify -modulate 100,0 -resize 400% "$SCR_IMG/scr.png"
tesseract "$SCR_IMG/scr.png" "$SCR_IMG/scr" -l chi_sim+jpn+eng # &> /dev/null
wl-copy < "$SCR_IMG/scr.txt"
hyprctl -q notify 5 3000 0 "Text extracted from image"
exit
