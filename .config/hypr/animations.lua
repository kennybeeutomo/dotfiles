hl.config({
	animations = {
		enabled = true,
	},
})

hl.curve("myBezier",
	{ type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })

-- hl.curve("easeOutQuint",
-- 	{ type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
--
-- hl.curve("easeInOutCubic",
-- 	{ type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
--
-- hl.curve("linear",
-- 	{ type = "bezier", points = { { 0, 0, 1 }, { 1 } } })
--
-- hl.curve("almostLinear",
-- 	{ type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1.0 } } })
--
-- hl.curve("quick",
-- 	{ type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.animation({ enabled = true, leaf = "windows", speed = 3, bezier = "myBezier" })
hl.animation({ enabled = true, leaf = "windowsOut", speed = 3, bezier = "default", style = "popin 80%" })
hl.animation({ enabled = true, leaf = "border", speed = 5, bezier = "default" })
hl.animation({ enabled = true, leaf = "borderangle", speed = 4, bezier = "default" })
hl.animation({ enabled = true, leaf = "fade", speed = 3, bezier = "default" })
hl.animation({ enabled = true, leaf = "workspaces", speed = 2, bezier = "default" })
-- hl.animation({ enabled = true, leaf = "global", speed = 10, bezier = "default" })
-- hl.animation({ enabled = true, leaf = "border", speed = 5.39, bezier = "easeOutQuint" })
-- hl.animation({ enabled = true, leaf = "windows", speed = 4.79, bezier = "easeOutQuint" })
-- hl.animation({ enabled = true, leaf = "windowsIn", speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
-- hl.animation({ enabled = true, leaf = "windowsOut", speed = 1.49, bezier = "linear", style = "popin 87%" })
-- hl.animation({ enabled = true, leaf = "fadeIn", speed = 1.73, bezier = "almostLinear" })
-- hl.animation({ enabled = true, leaf = "fadeOut", speed = 1.46, bezier = "almostLinear" })
-- hl.animation({ enabled = true, leaf = "fade", speed = 3.03, bezier = "quick" })
-- hl.animation({ enabled = true, leaf = "layers", speed = 3.81, bezier = "easeOutQuint" })
-- hl.animation({ enabled = true, leaf = "layersIn", speed = 4, bezier = "easeOutQuint", style = "fade" })
-- hl.animation({ enabled = true, leaf = "layersOut", speed = 1.5, bezier = "linear", style = "fade" })
-- hl.animation({ enabled = true, leaf = "fadeLayersIn", speed = 1.79, bezier = "almostLinear" })
-- hl.animation({ enabled = true, leaf = "fadeLayersOut", speed = 1.39, bezier = "almostLinear" })
-- hl.animation({ enabled = true, leaf = "workspaces", speed = 1.94, bezier = "almostLinear", style = "fade" })
-- hl.animation({ enabled = true, leaf = "workspacesIn", speed = 1.21, bezier = "almostLinear", style = "fade" })
-- hl.animation({ enabled = true, leaf = "workspacesOut", speed = 1.94, bezier = "almostLinear", style = "fade" })
