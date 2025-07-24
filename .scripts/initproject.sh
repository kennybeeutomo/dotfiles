#!/usr/bin/env bash
# Generate code project from template

if [ $# -eq 0 ]; then
	echo 'Usage: initproject.sh <type> <project name>'
	exit 1
fi

cp -r "$HOME/.scripts/project-templates/$1" "./$2"

find . -type f -exec sed -i "s/{PROGRAM_NAME}/$2/g" {} ';'
