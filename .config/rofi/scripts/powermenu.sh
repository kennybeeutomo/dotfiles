#!/bin/bash

choice=$(echo -e "  Shutdown\n  Reboot\n󰍃  Logout" | rofi -dmenu -i -p "Power Options")

case $choice in
	"  Shutdown")
		shutdown now
		;;
	"  Reboot")
		reboot
		;;
	"󰍃  Logout")
		i3-msg exit
		;;
esac
