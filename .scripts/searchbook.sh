#!/usr/bin/env bash
# Rofi script to search books

source ~/.scripts/utils

booksDir="$HOME/books"
rofi="rmenu -p Books"

# shellcheck disable=SC2012
dir=$(ls "$booksDir" | $rofi)
[ -z "$dir" ] && exit 1

file="$booksDir/$dir/$(fd --base-directory "$booksDir/$dir" -e pdf | $rofi)"
[ -z "$file" ] || [ -d "$file" ] && exit 1

zathura "$file"
