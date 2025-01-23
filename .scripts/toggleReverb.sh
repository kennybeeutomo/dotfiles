#!/usr/bin/env bash
# Script to toggle reverb by switching pipewire links between reverb sink and headphones sink

err() {
	hyprctl notify 2 2000 0 "$1"
	exit 1
}

success() {
	hyprctl notify 5 2000 0 "$1"
	exit 0
}

# port.alias
null_fl='default_null_sink:playback_FL'
null_fr='default_null_sink:playback_FR'
headphones_fl='Headphones:playback_FL'
headphones_fr='Headphones:playback_FR'
mpd_fl='mpd.PipeWire Sound Server:output_FL'
mpd_fr='mpd.PipeWire Sound Server:output_FR'

output_fl="${1:-$mpd_fl}"
output_fr="${2:-$mpd_fr}"

pw-link -d "$output_fl" "$null_fl"; pw-link -d "$output_fr" "$null_fr" || {
	(pw-link "$output_fl" "$null_fl") &
	(pw-link "$output_fr" "$null_fr") &
	pw-link -d "$output_fl" "$headphones_fl"
	pw-link -d "$output_fr" "$headphones_fr"
	success 'Reverb ON'
}

pw-link -d "$output_fl" "$headphones_fl"; pw-link -d "$output_fr" "$headphones_fr" || {
	(pw-link "$output_fl" "$headphones_fl") &
	(pw-link "$output_fr" "$headphones_fr") &
	success 'Reverb OFF'
}

err 'Unexpected error'
