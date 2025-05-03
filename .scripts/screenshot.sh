#!/usr/bin/env bash
# Screenshot script

exitCode=0

case $1 in
	fullscreen )
		grim $path
		;;
	selection )
		wayfreeze &
		sleep 0.1
		if [ -z "$2" ]; then
			grim -g "$(slurp)"
		else
			grim -g "$(slurp)" "$2"
		fi
		exitCode=$?
		killall wayfreeze
		;;
	* )
		exitCode=1
		;;
esac

exit $exitCode
