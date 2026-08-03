local M = {}

local exec = hl.dsp.exec_cmd

local terminal = "alacritty"

function M.terminal(opts)
	opts = opts or {}
	opts.args = opts.args or ""
	opts.floating = opts.floating or false

	local rules

	if opts.floating then
		rules = {
			float = true,
			center = true,
			size = { "(monitor_w*0.7)", "(monitor_h*0.7)" }
		}
	end

	return exec(terminal .. opts.args, rules)
end

return M
