local exec = hl.dsp.exec_cmd
local bind = hl.bind

local utils = require("utils")

local offset = 15

-----------------------
-- WINDOW MANAGEMENT --
-----------------------

-- Window Control
bind("SUPER + P",       hl.dsp.window.close(), { repeating = true })
bind("SUPER + Q",       hl.dsp.window.close(), { repeating = true })
bind("SUPER + ALT + P", hl.dsp.window.kill())
bind("SUPER + ALT + Q", hl.dsp.window.kill())
bind("SUPER + SPACE",   hl.dsp.window.float())
bind("SUPER + V",       hl.dsp.layout("togglesplit"), { repeating = true })
bind("SUPER + ALT + F", hl.dsp.window.fullscreen())
bind("SUPER + C",       hl.dsp.window.center())
bind("SUPER + T",       hl.dsp.window.pin())

-- Move Focus
bind("SUPER + H", hl.dsp.focus({ direction = "left" }), { repeating = true })
bind("SUPER + L", hl.dsp.focus({ direction = "right" }), { repeating = true })
bind("SUPER + K", hl.dsp.focus({ direction = "up" }), { repeating = true })
bind("SUPER + J", hl.dsp.focus({ direction = "down" }), { repeating = true })
bind("SUPER + F", hl.dsp.window.cycle_next({ floating = true }))
bind("SUPER + B", hl.dsp.window.cycle_next({ tiled = true }))

-- Swap Window
bind("SUPER + ALT + H", hl.dsp.window.swap({ direction = "left" }), { repeating = true })
bind("SUPER + ALT + L", hl.dsp.window.swap({ direction = "right" }), { repeating = true })
bind("SUPER + ALT + K", hl.dsp.window.swap({ direction = "up" }), { repeating = true })
bind("SUPER + ALT + J", hl.dsp.window.swap({ direction = "down" }), { repeating = true })

-- Resize Window
bind("SUPER + CTRL + H",       hl.dsp.window.resize({ x = -offset, y = 0, relative = true }), { repeating = true })
bind("SUPER + CTRL + L",       hl.dsp.window.resize({ x = offset, y = 0, relative = true }), { repeating = true })
bind("SUPER + CTRL + K",       hl.dsp.window.resize({ x = 0, y = -offset, relative = true }), { repeating = true })
bind("SUPER + CTRL + J",       hl.dsp.window.resize({ x = 0, y = offset, relative = true }), { repeating = true })
bind("SUPER + CTRL + ALT + H", hl.dsp.window.resize({ x = -3 * offset, y = 0, relative = true }), { repeating = true })
bind("SUPER + CTRL + ALT + L", hl.dsp.window.resize({ x = 3 * offset, y = 0, relative = true }), { repeating = true })
bind("SUPER + CTRL + ALT + K", hl.dsp.window.resize({ x = 0, y = -3 * offset, relative = true }), { repeating = true })
bind("SUPER + CTRL + ALT + J", hl.dsp.window.resize({ x = 0, y = 3 * offset, relative = true }), { repeating = true })

-- Move Floating Window
bind("SUPER + SHIFT + H",       hl.dsp.window.move({ x = -offset, y = 0, relative = true }), { repeating = true })
bind("SUPER + SHIFT + L",       hl.dsp.window.move({ x = offset,  y = 0, relative = true }), { repeating = true })
bind("SUPER + SHIFT + K",       hl.dsp.window.move({ x = 0,   y = -offset, relative = true }), { repeating = true })
bind("SUPER + SHIFT + J",       hl.dsp.window.move({ x = 0,   y = offset, relative = true }), { repeating = true })
bind("SUPER + SHIFT + ALT + H", hl.dsp.window.move({ x = -3 * offset, y = 0, relative = true }), { repeating = true })
bind("SUPER + SHIFT + ALT + L", hl.dsp.window.move({ x = 3 * offset,  y = 0, relative = true }), { repeating = true })
bind("SUPER + SHIFT + ALT + K", hl.dsp.window.move({ x = 0,   y = -3 * offset, relative = true }), { repeating = true })
bind("SUPER + SHIFT + ALT + J", hl.dsp.window.move({ x = 0,   y = 3 * offset, relative = true }), { repeating = true })

-- Move Workspace Focus
bind("SUPER + 1", hl.dsp.focus({ workspace = 1 }))
bind("SUPER + 2", hl.dsp.focus({ workspace = 2 }))
bind("SUPER + 3", hl.dsp.focus({ workspace = 3 }))
bind("SUPER + 4", hl.dsp.focus({ workspace = 4 }))
bind("SUPER + 5", hl.dsp.focus({ workspace = 5 }))
bind("SUPER + 6", hl.dsp.focus({ workspace = 6 }))
bind("SUPER + 7", hl.dsp.focus({ workspace = 7 }))
bind("SUPER + 8", hl.dsp.focus({ workspace = 8 }))
bind("SUPER + 9", hl.dsp.focus({ workspace = 9 }))
bind("SUPER + 0", hl.dsp.focus({ workspace = 10 }))

-- Move Workspace
bind("SUPER + CTRL + 1", hl.dsp.window.move({ workspace = 1 }))
bind("SUPER + CTRL + 2", hl.dsp.window.move({ workspace = 2 }))
bind("SUPER + CTRL + 3", hl.dsp.window.move({ workspace = 3 }))
bind("SUPER + CTRL + 4", hl.dsp.window.move({ workspace = 4 }))
bind("SUPER + CTRL + 5", hl.dsp.window.move({ workspace = 5 }))
bind("SUPER + CTRL + 6", hl.dsp.window.move({ workspace = 6 }))
bind("SUPER + CTRL + 7", hl.dsp.window.move({ workspace = 7 }))
bind("SUPER + CTRL + 8", hl.dsp.window.move({ workspace = 8 }))
bind("SUPER + CTRL + 9", hl.dsp.window.move({ workspace = 9 }))
bind("SUPER + CTRL + 0", hl.dsp.window.move({ workspace = 10 }))

-- Monitors
bind("SUPER + U",       hl.dsp.focus({ monitor = -1 }))
bind("SUPER + ALT + U", hl.dsp.window.move({ monitor = -1 }))

-- Minimize window
bind("SUPER + N", function()
	if hl.get_workspace("special:minimized") then
		hl.dispatch(hl.dsp.window.move({ workspace = hl.get_active_workspace(), window = "tag:minimized" }))
		hl.dispatch(hl.dsp.window.clear_tags({ window = "tag:minimized" }))
	else
		hl.dispatch(hl.dsp.window.tag({ tag = "minimized", window = hl.get_active_window() }))
		hl.dispatch(hl.dsp.window.move({ workspace = "special:minimized", follow = false }))
	end
end)

-- Mouse
-- 272 - left
-- 273 - right
-- 274 - middle
-- 275 - back
-- 276 - front
bind("SUPER + mouse:272",        hl.dsp.window.drag())
bind("SUPER + mouse:273",        hl.dsp.window.resize())
bind("SUPER + mouse:274",        hl.dsp.window.float())
bind("SUPER + CTRL + mouse:274", hl.dsp.window.fullscreen())
bind("SUPER + mouse:276",        hl.dsp.window.close())
bind("SUPER + CTRL + mouse:276", hl.dsp.window.kill())

-- Variables
bind("SUPER + I", function()
	hl.config({
		decoration = {
			blur = { enabled = not hl.get_config("decoration.blur.enabled") }
		}
	})
end, { description = "Toggle Blur" })

bind("SUPER + SHIFT + I", function()
	hl.config({
		animations = {
			enabled = not hl.get_config("animations.enabled")
		}
	})
end, { description = "Toggle Animations" })

--------------
-- PROGRAMS --
--------------

-- Terminals
bind("SUPER + RETURN",        utils.terminal(), { repeating = true })
bind("SUPER + CTRL + RETURN", utils.terminal({ floating = true }), { repeating = true })

-- Rofi Menus
bind("SUPER + R",               exec("rofi -x11 -show combi"))
bind("SUPER + SHIFT + R",       exec("prime-run rofi -x11 -show combi"))
bind("SUPER + F1",              exec("powermenu.sh"))
bind("SUPER + CTRL + E",        exec("edit.sh"))
bind("SUPER + ALT + 4",         exec("rofimoji"))
bind("SUPER + CTRL + ALT + 4",  exec("unicodemenu.sh"))
bind("SUPER + ALT + E",         exec("experiment.sh -d existing"))
bind("SUPER + SHIFT + ALT + E", exec("experiment.sh -d new"))
bind("SUPER + CTRL + ALT + E",  exec("searchbook.sh"))

-- Wallpaper
bind("SUPER + W",               exec("pywalctl.sh chwal"))
bind("SUPER + SHIFT + W",       exec("pywalctl.sh nopywal"))
bind("SUPER + CTRL + W",        exec("pywalctl.sh justpywal"))
bind("SUPER + ALT + W",         exec("pywalctl.sh backend"))
bind("SUPER + CTRL + ALT + W",  exec("pywalctl.sh saturation"))
bind("SUPER + SHIFT + ALT + W", exec("pywalctl.sh toggleBlackColors"))

-- Launch Programs
bind("SUPER + E",         exec("thunar"))
bind("SUPER + Y",         utils.terminal({ args = " -e yazi", floating = true }))
bind("SUPER + D",         exec("firefox"))
bind("SUPER + SHIFT + D", exec("firefox --private-window"))
bind("SUPER + M",         utils.terminal({ args = " -e rmpc", floating = true }))
bind("SUPER + A",         exec("lorien.sh", { floating = true }))

-- Waybar Control
bind("SUPER + grave",         exec("wbctl.sh togglehide"))
bind("SUPER + SHIFT + grave", exec("wbctl.sh toggle"))
bind("SUPER + CTRL + grave",  exec("wbctl.sh reload"))
bind("SUPER + ALT + grave",   exec("wbctl.sh pick"))

-- Alacritty Opacity Control
bind("SUPER + O",         exec("ala-opc.sh increase"), { repeating = true })
bind("SUPER + SHIFT + O", exec("ala-opc.sh decrease"), { repeating = true })
bind("SUPER + CTRL + O",  exec("ala-opc.sh reset"))

-- Music/Audio Control
bind("SUPER + bracketLeft",        exec("mpc toggle"))
bind("SUPER + bracketRight",       exec("mpc clear"))
bind("SUPER + comma",              exec("mpc volume -5"), { repeating = true })
bind("SUPER + period",             exec("mpc volume +5"), { repeating = true })
bind("SUPER + SHIFT + comma",      exec("mpc seek -0:0:5"), { repeating = true })
bind("SUPER + SHIFT + period",     exec("mpc seek +0:0:5"), { repeating = true })
bind("SUPER + CTRL + comma",       exec("mpc prev"), { repeating = true })
bind("SUPER + CTRL + period",      exec("mpc next"), { repeating = true })
bind("SUPER + CTRL + P",           exec("pavucontrol"))
bind("SUPER + apostrophe",         exec("toggleReverb.sh"))
bind("SUPER + SHIFT + apostrophe", exec("toggleReverb.sh 'Firefox'"))

-- Screenshots
bind("SUPER + G",         exec("screenshot.sh selection"))
bind("SUPER + CTRL + G",  exec("screenshot.sh fullscreen"))
bind("SUPER + SHIFT + G", exec("ocr.sh"))
bind("SUPER + ALT + G",   utils.terminal({ args = ' -e yazi "$HOME/Pictures/Screenshots"', floating = true }))
bind("SUPER + ALT + 2",   exec("qrscan.sh"))

-- Dunst
bind("SUPER + X",         exec("dunstctl close"), { repeating = true })
bind("SUPER + SHIFT + X", exec("systemctl --user restart dunst.service"), { repeating = true })

-- Miscellaneous
bind("SUPER + SHIFT + P",      exec("prop.sh"))
bind("SUPER + backslash",      exec("hyprlock"))
bind("SUPER + ALT + 1",        exec("hyprpicker -a"))
bind("SUPER + ALT + 3",        utils.terminal({ args = " -e colorscripts.sh", floating = true }))
bind("SUPER + CTRL + ALT + 3", utils.terminal({ args = " -e nvim -R ~/.cache/wal/colors-readable.txt", floating = true }))
bind("SUPER + ALT + 5",        utils.terminal({ args = " -e clock.sh", floating = true }))
bind("SUPER + CTRL + ALT + 5", utils.terminal({ args = " -e clock.sh nodate", floating = true }))
bind("SUPER + Z",              exec("editclipboard.sh"))
bind("SUPER + F2",             exec("cpulimiter.sh"))

-- Laptop fn keys
bind("XF86AudioRaiseVolume",  exec("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 2%+"), { repeating = true, locked = true })
bind("XF86AudioLowerVolume",  exec("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"), { repeating = true, locked = true })
bind("XF86AudioMute",         exec("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { repeating = true, locked = true })
bind("XF86AudioMicMute",      exec("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { repeating = true, locked = true })
bind("XF86MonBrightnessUp",   exec("brightnessctl s 50%+"), { repeating = true, locked = true })
bind("XF86MonBrightnessDown", exec("brightnessctl s 50%-"), { repeating = true, locked = true })
bind("XF86Touchpadon",        exec("dunstify 'Touchpad ON'"), { repeating = true, locked = true })
bind("XF86Touchpadoff",       exec("dunstify 'Touchpad OFF'"), { repeating = true, locked = true })
