#!/usr/bin/env bash
# Generate C code from template

if [ $# -eq 0 ]; then
	echo 'Usage: initc.sh <project names>'
	exit 1
fi

for f in "$@"; do
	mkdir "$f"
	cp -r $HOME/.scripts/cfiles/* "./$f"
	sed -i "s/{PROGRAM_NAME}/$f/" "./$f/Makefile"
done
