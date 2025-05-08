#!/usr/bin/env bash
# script to edit hyprland-variables.conf values

printUsage() {
	echo 'printUsage: hyprvars.sh <variable> <operation> <value>'
	echo 'operations:'
	echo '	- set <value> = sets <variable> to <value>'
	echo '	- add <value> = adds <variable> by <value>'
	echo '	- invert = inverts boolean <variable> (must be true or false)'
	echo '	- get = prints current value of <variable>'
	exit 1
}

file="$XDG_CONFIG_HOME/hypr/hyprland-variables.conf"
var="\$$1 = "
operation=$2
value=$3

line=$(grep "$var" "$file" | head -n 1)
[ -z "$line" ] && echo "Variable $1 not found" && exit 1
currentValue=${line##"$var"}

set() {
	sed -i "s/$line/${var}${value}/" "$file"
}

if [ $# -eq 3 ]; then
	case "$operation" in
		'set' )
			set
			;;
		'add' )
			value=$(( $currentValue + $value ))
			set
			;;
		* )
			printUsage
			;;
	esac
fi

if [ $# -eq 2 ]; then
	case "$operation" in
		'invert' )
			if [ "$currentValue" = 'true' ]; then
				value='false'
			elif [ "$currentValue" = 'false' ]; then
				value='true'
			else
				printUsage
			fi
			set
			;;
		'get' )
			echo $currentValue
			;;
		* )
			printUsage
			;;
	esac
fi
