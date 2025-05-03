#!/usr/bin/env bash
# Rofi script for code experiments

source ~/.scripts/utils

EDITOR=${EDITOR:-nvim}

cmd="$EDITOR"
terminal=alacritty
experimentsDir="$HOME/code/experimentation"

language=$(ls $experimentsDir | rmenu -p 'Experiment')
[ -z "$language" ] && exit 1

# go to chosen dir
experimentsDir+="/$language"
cd "$experimentsDir"

# find main file
mainFile="$(find -name 'main.*' -not -name 'main.o')"
cmd+=" $mainFile"

eval $terminal --class 'experiment.sh' -e $cmd $args
