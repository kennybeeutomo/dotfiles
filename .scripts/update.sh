#!/usr/bin/env bash
# Script to keep track of installed packages after updating

yay
yay -Qe > ~/dotfiles/pacman_packages
cd ~/dotfiles
git add pacman_packages
