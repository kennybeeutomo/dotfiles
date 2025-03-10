#!/usr/bin/env bash
# script to display clock

tput civis # hide cursor
tput smcup # save screen

font='colossal'
figlet_height=8

draw() {
	echo -e '\e[94m' # set color to bright blue

	rows=$(tput lines)
	cols=$(tput cols)

	Time=$(date '+%H : %M : %S')
	Date=$(date '+%A, %d %B %Y')

	Date_len=$(echo "$Date" | wc -m)

	Date_pos=$(( $cols / 2 + $Date_len / 2 ))
	Time_pos=$(( $rows / 2 - $figlet_height / 2 ))

	tput cup $Time_pos

	figlet -p -t -c -f "$font" " $Time " # | sed 's/#/█/g'

	[ "$1" == 'nodate' ] || printf "%${Date_pos}s" "$Date"
}

trap "tput clear && draw" SIGWINCH # refresh when resized

while [ -z "$input" ]; do
	draw
	read -rs -n 1 -t 1 input
done

tput rmcup # restore screen
tput cnorm # unhide cursor
