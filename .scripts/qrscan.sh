#!/usr/bin/env bash
# Similar script to ocr.sh but to scan qr

source ~/.scripts/utils

screenshot="$HOME/.scripts/screenshot.sh"

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
success "Scan result copied to clipboard"
