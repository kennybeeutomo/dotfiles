#!/usr/bin/env bash
# Rofi script for code experiments

# shellcheck disable=SC1090
source ~/.scripts/utils

experimentsDir="$HOME/code/experimentation"

# shellcheck disable=SC2012
language=$(ls "$experimentsDir" | rmenu -p 'Experiment')
[ -z "$language" ] && exit 1

# go to chosen dir
experimentsDir+="/$language"
cd "$experimentsDir" || exit 1

# find main file
mainFile=$(cat .mainpath) || exit 1

persisterm . 'experiment.sh' "nvim '$mainFile'"
