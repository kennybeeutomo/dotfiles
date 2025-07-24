#!/usr/bin/env bash
# Script to fetch the frequency of an audio

source ~/.scripts/utils

execfor 'ffprobe -v error -select_streams a:0 -show_entries stream=sample_rate -of default=nw=1:nk=1' "$@"
