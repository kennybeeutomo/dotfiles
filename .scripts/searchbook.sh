#!/usr/bin/env bash
# Rofi script to search books

booksDir="$HOME/books"
rofi="rofi -x11 -i -dmenu -p Books"

dir=$(ls $booksDir | $rofi)
[ -z "$dir" ] && exit 1

file="$booksDir/$dir/$(fd --base-directory "$booksDir/$dir" -e pdf | $rofi)"
[ -z "$file" ] || [ -d "$file" ] && exit 1

zathura "$file"
