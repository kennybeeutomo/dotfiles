#!/usr/bin/env bash
# Shows random colorscripts repeatedly

until [ "$input" == 'q' ]; do
	colorscript -r
	read -n 1 -s input
	clear
done
