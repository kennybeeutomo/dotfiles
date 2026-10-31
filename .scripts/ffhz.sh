#!/usr/bin/env bash
# Script to fetch the frequency of an audio
# Dependencies: ffmpeg

# shellcheck disable=SC1090
source ~/.scripts/utils

for file in "$@"; do
	ffprobe -v error -select_streams a:0 -show_entries stream=sample_rate -of default=nw=1:nk=1 "$file"
done
