#!/usr/bin/env bash
# Script to bootstrap lorien

lorien &
sleep 0.7

# Hide toolbar
hyprctl dispatch 'hl.dsp.send_shortcut({ key = "TAB", window = "class:(^Lorien$)" })'
