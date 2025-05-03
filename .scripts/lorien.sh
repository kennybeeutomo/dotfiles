#!/usr/bin/env bash
# Script to bootstrap lorien

lorien &
sleep 0.6

# Hide toolbar
hyprctl dispatch sendshortcut ,TAB, 'class:(^Lorien$)'
