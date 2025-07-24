#!/usr/bin/env bash
# Shows random colorscripts repeatedly
# Requires shell-color-scripts-git

until [ "$input" == 'q' ]; do
	colorscript -r
	read -n 1 -sr input
	clear
done
