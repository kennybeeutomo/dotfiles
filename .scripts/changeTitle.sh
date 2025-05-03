#!/usr/bin/env bash
# Script to change media title metadata (WIP)

[[ $# -ne 2 ]] && {
	echo 'Usage: changeTitle.sh <media name> <title>'
	exit 1
}

ffmpeg -i "$1" -metadata title="$2" "$1"
