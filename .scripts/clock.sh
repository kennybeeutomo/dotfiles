#!/usr/bin/env bash
# script to display clock

font='colossal'
figlet_height=8

echo -ne '\e[?47h'

while [ -z "$input" ]; do
	echo -ne '\033c' # clear
	echo -ne '\e[?25l' # hide cursor
	echo -e '\e[94m' # set color to bright blue

	rows=$(tput lines)
	cols=$(tput cols)

	Time=$(date '+%H : %M : %S')
	Date=$(date '+%A, %d %B %Y')

	Date_len=$(echo "$Date" | wc -m)

	Date_pos=$(( $cols / 2 + $Date_len / 2 ))
	Time_pos=$(( $rows / 2 - $figlet_height / 2 ))

	tput cup $Time_pos

	figlet -p -t -c -f "$font" "$Time" # | sed 's/#/█/g'

	[ "$1" == 'nodate' ] || printf "%${Date_pos}s" "$Date"

	read -rs -n 1 -t 1 input
done

echo -ne '\033c' # clear
echo -ne '\e[?25h' # unhide cursor
