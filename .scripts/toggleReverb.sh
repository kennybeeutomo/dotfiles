#!/usr/bin/env bash
# Script to toggle reverb by switching pipewire links between reverb sink and headphones sink

err() {
	hyprctl notify 3 2000 0 "$1"
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

mpd='mpd.PipeWire Sound Server'

output_fl="${1:-$mpd}:output_FL"
output_fr="${1:-$mpd}:output_FR"

if [ $(echo $(pw-filter-id.sh "port.alias" "\"$output_fl\"" | wc -l)) -gt 1 ]; then
	err 'Multiple outputs'
fi

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
