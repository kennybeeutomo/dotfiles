# exec Hyprland > /dev/null

if uwsm check may-start; then
    exec uwsm start hyprland.desktop
fi
