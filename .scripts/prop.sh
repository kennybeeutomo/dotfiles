#!/usr/bin/env bash
# Output window class and title through dunstify

IFS=$'\n'
dunstify -i 0 "Window Properties" "$(printf "Xwayland: %s\nClass: %s\nTitle: %s\n" $(hyprprop | jq -r '.xwayland, .class, .title'))"
