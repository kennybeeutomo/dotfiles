#!/usr/bin/env bash
# Script to slow down audio by 0.8, by lowering its frequency

if [ $# -ne 1 ]; then
	echo 'Usage: ffslow.sh <audio name>' 1>&2
	exit 1
fi

freq=$(ffhz.sh "$1")
slowFreq=$(($freq*4/5)) # freq * 0.8
name=$(arename.sh "$1" '-slow')

ffmpeg -i "$1" -filter:a "asetrate=$slowFreq" "$name"
