#!/usr/bin/env bash
# Script to slow down audio by 0.8, by lowering its frequency
# Dependencies: ffmpeg

# shellcheck disable=SC1090
source ~/.scripts/utils

if [ $# -ne 1 ]; then
	echo 'Usage: ffslow.sh <audio name>' 1>&2
	exit 1
fi

freq=$(ffhz.sh "$1")
slowFreq=$((freq*4/5)) # freq * 0.8
name=$(arename "$1" '-slow')

ffmpeg -i "$1" -filter:a "asetrate=$slowFreq" "$name"
