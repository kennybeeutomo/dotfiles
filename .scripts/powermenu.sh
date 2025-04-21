#!/usr/bin/env bash
# Similar to Wlogout

rofiConfig="$HOME/.config/rofi/config-vi.rasi"

choice=$(echo -e "  Shutdown\n  Reboot\n󰍃  Logout" | rofi -x11 -config $rofiConfig -dmenu -i -p "Power Options")

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
