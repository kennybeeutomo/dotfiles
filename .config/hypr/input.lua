hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "caps:swapescape",
		kb_rules = "",

		repeat_rate = 60,
		repeat_delay = 200,

		follow_mouse = 1,
		focus_on_close = 1,
		mouse_refocus = false,

		sensitivity = 0,
		force_no_accel = false,

		touchpad = {
			natural_scroll = true,
			scroll_factor = 0.1,
		},
	},
})

-- use `hyprctl devices` to get device names
hl.device({
	name = "2.4g-mouse-1",
	sensitivity = -1,
})

hl.device({
	name = "2.4g-mouse",
	sensitivity = -1,
})

hl.device({
	name = "elan0524:00-04f3:3215-touchpad",
	sensitivity = 0.8,
	accel_profile = "flat",
})
