#!/usr/bin/env bash
# Rofi script to insert unicode characters
# Requires wtype
# Unicode text file retrieved from https://gist.github.com/ruanyl/179e81e9d59fdca6862e1373240e5cf2

# shellcheck disable=SC1090
source ~/.scripts/utils

unicodeText="$HOME/.scripts/unicode.txt"

wtype "$(rmenu -p 'Unicode' < "$unicodeText" | cut -f 1)"
