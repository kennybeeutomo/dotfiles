#!/usr/bin/env bash
# Rofi script for code experiments

# shellcheck disable=SC1090
source ~/.scripts/utils

experimentsDir="$HOME/code/experimentation"
templatesDir="$HOME/.scripts/project-templates"

# shellcheck disable=SC2012
language=$(ls "$templatesDir" | rmenu -p 'Experiment')
[ -z "$language" ] && exit 1

case "$1" in
	'new' ) # create new experiment directory
		date=$(date +'%Y-%m-%d-%H-%M-%S-%N')
		experimentDir+="$experimentsDir/$language"
		template="$templatesDir/$language"
		mkdir -p "$experimentDir"
		cp -r "$template" "$experimentDir/$date"
		experimentDir+="/$date"
		;;
	'existing' ) # edit in existing experiment directory
		experimentDir="$experimentsDir/$language"

		# reverse ls to put most recent one at the top of the rofi menu
		# shellcheck disable=SC2012
		experimentDir+="/$(ls -r "$experimentDir" | rmenu -p 'Experiment')"
		;;
	* ) exit 1;;
esac

cd "$experimentDir" || exit 1

# find main file
mainFile=$(cat .mainpath) || exit 1

persisterm . 'experiment.sh' "nvim '$mainFile'"
