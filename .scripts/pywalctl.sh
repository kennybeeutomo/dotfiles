#!/usr/bin/env bash
# Script to change wallpaper and automate pywal

source ~/.scripts/utils


changeWallpaper() {
	local wallpaperDir="$HOME/Pictures/Wallpaper"
	local prompt

	case "$1" in
		chwal ) prompt='Change Wallpaper and Colors' ;;
		nopywal ) prompt='Change Wallpaper';;
		justpywal ) prompt='Change Colors';;
		* ) return 1 ;;
	esac

	# shellcheck disable=SC2012,SC2155
	local chosenDir=$(ls "$wallpaperDir" | vmenu -p "$prompt")

	if ! cd "$wallpaperDir/$chosenDir"; then
		echo 'No directory chosen'
		return 1
	fi

	# shellcheck disable=SC2155
	local wallpapers=$(find . -maxdepth 0)

	wallpaper=$(pickimg "$wallpapers")

	case "$1" in
		chwal ) chwal "$wallpaper" ;;
		nopywal ) swww-img "$wallpaper" ;;
		justpywal ) pywal "$wallpaper" ;;
		* ) return 1 ;;
	esac
}


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

unsaturate() {
	copyBlackColors "$normal" "$current"
}

saturate() {
	rm "$current"
}

changeBlackColors() {
	# shellcheck disable=SC2155
	local wallpaper=$(sed 's/[\/.]/_/g' "$HOME/.cache/wal/wal")

	# shellcheck disable=SC2155
	local saturation=$(getoption walsaturation None)

	[ "$saturation" = 'None' ] && echo 'Saturation cannot be None' && exit 1

	# shellcheck disable=SC2155
	local backend=$(getoption walbackend wal)

	local normal current
	normal=$(getWalScheme "${wallpaper}*${backend}_None*") || exit 1
	current=$(getWalScheme "${wallpaper}*${backend}_${saturation}*") || exit 1

	[ "$current" = "$normal" ] && echo 'Same scheme as the normal one' && exit 1

	case "$1" in
		unsaturateBlackColors ) unsaturate ;;
		saturateBlackColors ) saturate ;;
		toggleBlackColors )
			jqEqualValue "$normal" "$current" '.colors.color0, .colors.color8, .special.background' && saturate || unsaturate
			;;
		* )
			exit 1
			;;
	esac && pywal auto
}


main() {
	case "$1" in
		chwal | nopywal | justpywal ) changeWallpaper "$1" ;;

		saturateBlackColors | unsaturateBlackColors | toggleBlackColors ) changeBlackColors "$1" ;;

		backend )
			optionmenu vmenu 'Pywal Backend' 'walbackend' \
				'wal' \
				'colorz' \
				'colorthief' \
				'haishoku' \
				'okthief' \
				&& pywal auto
			;;

		saturation )
			optionmenu vmenu 'Pywal Saturation' 'walsaturation' \
				None 0.{0..9} 1.0 \
				&& pywal auto
			;;

		* ) exit 1 ;;
	esac
}

main "$@"
