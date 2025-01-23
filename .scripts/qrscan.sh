#!/usr/bin/env bash
# Similar script to ocr.sh but to scan qr

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

"$screenshot" selection "$SCR_IMG/scr.png" || die "Scan cancelled"
scanResult="$(zbarimg -Sqrcode.enable -q --raw "$SCR_IMG/scr.png")"
[ -z $scanResult ] && die "Scan failed"
wl-copy $scanResult
hyprctl -q notify 5 3000 0 "Scan result copied to clipboard"
exit
