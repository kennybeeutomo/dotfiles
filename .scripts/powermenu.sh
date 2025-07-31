#!/usr/bin/env bash
# Similar to Wlogout

# shellcheck disable=SC1090
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
