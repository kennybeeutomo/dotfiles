#!/usr/bin/env bash
# Cycles through colorscripts
# Dependencies: shell-color-scripts-git

index=2
n=$(( $(colorscript -l | wc -l) - 1 ))

until [ "$input" == 'q' ]; do
	colorscript -e $(( index + 1 ))
	read -n 1 -sr input

	case $input in
		h | j | p ) index=$(( index - 1 )) ;;
		l | k | n ) index=$(( index + 1 )) ;;
	esac

	index=$(( (index + n) % n ))

	clear
done
