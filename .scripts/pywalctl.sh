#!/usr/bin/env bash
# Script to change wallpaper and automate pywal

# shellcheck disable=SC1090
source ~/.scripts/utils


changeWallpaper() {
	wallpaperDir="$HOME/Pictures/Wallpaper"

	opts=$(getopt -o h -- "$@")
	eval set -- "$opts"
	while [ -n "$1" ]; do
		case "$1" in
			-h ) hidden=1; shift ;;
			-- ) shift; break ;;
			* ) return 1 ;;
		esac
	done

	action=$1; shift

	case "$action" in
		chwal ) prompt='Change Wallpaper and Colors' ;;
		nopywal ) prompt='Change Wallpaper';;
		justpywal ) prompt='Change Colors';;
		* ) return 1 ;;
	esac

	if [ -n "$hidden" ]
	then dirList=$(ls -A "$wallpaperDir")
	else dirList=$(ls "$wallpaperDir")
	fi

	chosenDir=$(vmenu -p "$prompt" <<< "$dirList")

	if ! cd "$wallpaperDir/$chosenDir"; then
		echo 'No directory chosen'
		return 1
	fi

	wallpapers=$(find . -maxdepth 0)

	wallpaper=$(pickimg "$wallpapers")

	case "$action" in
		chwal ) chwal "$wallpaper" ;;
		nopywal ) awww-img "$wallpaper" ;;
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
	scheme=$(find "$HOME/.cache/wal/schemes" -maxdepth 1 -name "$1")
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
	wallpaper=$(sed 's/[\/.]/_/g' "$HOME/.cache/wal/wal")

	saturation=$(getoption walsaturation None)

	[ "$saturation" = 'None' ] && echo 'Saturation cannot be None' && exit 1

	backend=$(getoption walbackend wal)

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
		chwal | nopywal | justpywal ) changeWallpaper "$@" ;;

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
