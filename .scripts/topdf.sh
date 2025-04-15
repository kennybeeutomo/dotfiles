#!/usr/bin/env bash
# Script to convert files to pdf. LibreOffice required

for file in "$@"; do
	echo "Converting $file to pdf"
	soffice --headless --convert-to pdf "$file"
done
