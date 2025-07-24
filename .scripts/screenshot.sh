#!/usr/bin/env bash
# Screenshot script

exitCode=0

screenshotSelection() {
	path=$1

	wayfreeze &
	sleep 0.1

	if [ -n "$path" ]; then
		grim -g "$(slurp -o)" "$path"
	else
		grim -g "$(slurp -o)"
	fi

	exitCode=$?
	killall wayfreeze
}

case $1 in
	fullscreen )
		grim
		;;
	selection )
		screenshotSelection "$2"
		;;
	* )
		exitCode=1
		;;
esac

exit $exitCode
