#!/usr/bin/env bash
# Script to fetch the frequency of an audio

IFS=';'
files=$*

for f in ${files[*]}; do
	ffprobe -v error -select_streams a:0 -show_entries stream=sample_rate -of default=nw=1:nk=1 "$f"
done
