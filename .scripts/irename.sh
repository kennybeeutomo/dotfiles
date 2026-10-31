#!/usr/bin/env bash
# Script to interactively rename files in editor

tempDir='/tmp/irename'

[ -d "$tempDir" ] || mkdir "$tempDir"
file=$(mktemp --tmpdir=$tempDir)

echo "$1" > "$file"
"${EDITOR:-nvim}" "$file"
rename "$1" "$(cat "$file")" "$1"
