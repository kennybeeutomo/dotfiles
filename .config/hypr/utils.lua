local M = {}

local terminal = "kitty"

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

	return hl.dsp.exec_cmd(terminal .. opts.args, rules)
end

function M.rule(rule)
	if rule.name == nil then
		table.insert(Window_Rules, hl.window_rule(rule))
	else
		Window_Rules[rule.name] = hl.window_rule(rule)
	end
end

function M.log(msg)
	hl.exec_cmd("dunstify " .. msg)
end

function M.toggle_rule(rule_name)
	return function()
		local rule = Window_Rules[rule_name]
		rule:set_enabled(not rule:is_enabled())
	end
end

return M
