local rule = hl.window_rule

rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})

rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

local edit_menu_pattern = "(^edit.sh$)"
local python_pattern = "(^python3$)"
local thunar_pattern = "(^T|thunar$)"
local lorien_pattern = "(^Lorien$)"
local edit_clipboard_pattern = "(^editClipboard$)"
local experiment_pattern = "(^experiment.sh$)"
local mpv_pattern = "(^mpv$)"
local ueberzugpp_pattern = "(^ueberzugpp.*$)"
local pickimg_pattern = "(^pickimg$)"
local browser_pattern = "(^firefox$)"

rule({
	name = "pickimg",
	match = { class = pickimg_pattern },
	float = true,
	center = true,
})

rule({
	name = "ueberzugpp-fix",
	match = { class = ueberzugpp_pattern },
	float = true,
	no_focus = true,
	no_anim = true,
	border_size = 0,
	rounding = 0,
	opaque = true,
})

rule({
	name = "floating",
	match = {
		class = edit_menu_pattern ..
				"|" .. python_pattern ..
				"|" .. thunar_pattern ..
				"|" .. lorien_pattern ..
				"|" .. edit_clipboard_pattern ..
				"|" .. experiment_pattern ..
				"|" .. mpv_pattern
	},
	float = true,
	center = true,
	size = { "(monitor_w*0.7)", "(monitor_h*0.7)" },
})

rule({
	name = "lorien",
	match = { class = lorien_pattern },
	no_blur = true,
	opacity = 0.7
})

rule({
	name = "thunar",
	match = { class = thunar_pattern },
	opacity = 0.8
})

rule({
	name = "browser",
	match = { class = browser_pattern },
	opaque = true
})
