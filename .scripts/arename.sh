#!/usr/bin/env bash
# Script to append text at the end of file's basename

if [ $# -ne 2 ]; then
	echo 'Usage: arename.sh <file name> <suffix>' 1>&2
	exit 1
fi

input="$1"
suffix="$2"

base="${input%.*}"
extension="${input#$base}"
output="${base}${suffix}${extension}"

echo "$output"
