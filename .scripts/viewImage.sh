#!/usr/bin/env bash
# Script to make image viewing better

[[ $# -lt 1 ]] && exit 1

if [ -d "$1" ]; then
	# argument = directory
	swiv "$1"
elif [ -f "$1" ]; then
	# argument = file
	imgDir="$(dirname "$1")"
	img="$(basename "$1")"

	imgIndexed=$(find "$imgDir" -maxdepth 1 -type f | sort | grep -nF "$img")

	IFS=':' read -ra index <<< "$imgIndexed"

	swiv -n "${index[0]}" "$imgDir"
else
	exit 1
fi
