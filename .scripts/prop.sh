#!/usr/bin/env bash
# Output window class and title through hyprctl notify

string=$(printf "Xwayland: %s;Class: %s;Title: %s\n" $(hyprprop | jq -r '.xwayland, .class, .title'))
IFS=';' read -ra substrings <<< "$string"

for substring in "${substrings[@]}"; do
    hyprctl -q notify -1 4000 0 "$substring"
done
