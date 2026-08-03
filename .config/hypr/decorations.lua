local wal = require("colors-hypr")

hl.config({
	general = {
		gaps_in = 3,
		gaps_out = 5,

		border_size = 2,

		col = {
			active_border = { colors = { wal.brightCyan, wal.blue }, angle = 45 },
			inactive_border = wal.brightBlack,
		},

		resize_on_border = false,

		allow_tearing = false,
		layout = "dwindle",

		snap = {
			enabled = true,
		},
	},

	decoration = {
		rounding = 4,

		active_opacity = 1.0,
		inactive_opacity = 0.95,

		shadow = {
			enabled = false,
			range = 4,
			render_power = 3,
			color = "#1a1a1aee",
		},

		blur = {
			enabled = true,
			size = 2,
			passes = 2,
			vibrancy = 0.1696,
		},
	},

	cursor = {
		hide_on_key_press = true,
	},

	dwindle = {
		preserve_split = true,
	},

	master = {
		new_status = "master",
	},

	scrolling = {
		column_width = 1.0,
	},

	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
	},

	ecosystem = {
		no_update_news = true,
	},
})
