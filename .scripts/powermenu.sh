#!/usr/bin/env bash
# Similar to Wlogout

source ~/.scripts/utils

choice=$(echo -e "  Shutdown\n  Reboot\n󰍃  Logout" | vmenu -p "Power Options")

case $choice in
	"  Shutdown")
		shutdown now
		;;
	"  Reboot")
		reboot
		;;
	"󰍃  Logout")
		uwsm stop
		;;
esac
