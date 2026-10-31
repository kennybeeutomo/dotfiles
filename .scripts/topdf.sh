#!/usr/bin/env bash
# Script to convert files to pdf
# Dependencies: libreoffice-fresh

for file in "$@"; do
	echo "Converting $file to pdf"
	soffice --headless --convert-to pdf "$file"
done
