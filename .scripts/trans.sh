#!/usr/bin/env bash
# Wrapper script to cache translation results from trans-shell + rofi interface
# Dependencies: translate-shell

# shellcheck disable=SC1090
source ~/.scripts/utils

cacheDir="$XDG_CACHE_HOME/dotfiles/trans-cache"

[ ! -d "$cacheDir" ] && mkdir -p "$cacheDir"

getTranslation() {
	[ -z "$arg" ] && exit 1
	translationFile="$cacheDir/$arg"
	if [ ! -f "$translationFile" ]; then
		# shellcheck disable=SC2086
		translation=$(trans -no-ansi -j $arg)
		[ -z "$translation" ] && exit 1
		echo "$translation" > "$translationFile"
	fi
}

mode=$1; shift

case "$mode" in
	'rofi' )
		arg=$(find "$cacheDir" -type f -printf '%f\n' | rmenu -p translate)
		getTranslation
		kitty --class 'trans.sh' nvimpager -p "$translationFile"
		;;
	'cli' )
		arg=$*
		getTranslation
		nvimpager -p "$translationFile"
		;;
	 'cat' )
		arg=$*
		getTranslation
		cat "$translationFile"
		;;
	* ) exit 1 ;;
esac
