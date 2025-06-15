#!/usr/bin/env bash
# Screenshot script

exitCode=0

screenshotSelection() {
	wayfreeze &
	sleep 0.1
	if [ -z "$1" ]; then
		grim -g "$(slurp $slurpOpts)"
	else
		grim -g "$(slurp $slurpOpts)" "$1"
	fi
	exitCode=$?
	killall wayfreeze
}

case $1 in
	fullscreen )
		grim $path
		;;
	monitor )
		slurpOpts='-o'
		screenshotSelection "$2"
		;;
	selection )
		screenshotSelection "$2"
		;;
	* )
		exitCode=1
		;;
esac

exit $exitCode
