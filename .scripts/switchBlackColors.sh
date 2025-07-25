#!/usr/bin/env bash
# script to switch between saturated and unsaturated black colors in pywal

source ~/.scripts/utils

wallpaper=$(sed 's/[\/.]/_/g' "$HOME/.cache/wal/wal")
saturation=$(getoption walsaturation None)

[ "$saturation" = 'None' ] && echo 'Saturation cannot be None' && exit 1

backend=$(getoption walbackend wal)

copyBlackColors() {
	local src=$1
	local dest=$2

	jqCopyValue "$src" "$dest" '.colors.color0'
	jqCopyValue "$src" "$dest" '.colors.color8'
	jqCopyValue "$src" "$dest" '.special.background'
}

getWalScheme() {
	scheme=$(find "$HOME/.cache/wal/schemes" -name "$1")
	[ "$(wc -l <<< "$scheme")" -gt 1 ] && return 1
	[ ! -f "$scheme" ] && return 1
	echo "$scheme"
}

getNormalScheme() {
	getWalScheme "${wallpaper}*${backend}_None*"
}

getCurrentScheme() {
	getWalScheme "${wallpaper}*${backend}_${saturation}*"
}

normal=$(getNormalScheme)
[ -z "$normal" ] && exit 1

current=$(getCurrentScheme)
[ -z "$current" ] && exit 1

[ "$current" = "$normal" ] && echo 'Same scheme as the normal one' && exit 1

unsaturate() {
	copyBlackColors "$normal" "$current"
}

saturate() {
	rm "$current"
}

case "$1" in
	unsaturate ) unsaturate ;;
	saturate ) saturate ;;
	toggle )
		jqEqualValue "$normal" "$current" '.colors.color0, .colors.color8, .special.background' && saturate || unsaturate
		;;
	* )
		exit 1
		;;
esac && pywal auto
