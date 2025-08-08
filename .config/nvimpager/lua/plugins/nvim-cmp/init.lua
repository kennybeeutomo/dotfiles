local M = {}

function M.setup()
	-- Set up nvim-cmp.
	local cmp = require('cmp')

	cmp.setup({
		window = {
			-- completion = cmp.config.window.bordered(),
			-- documentation = cmp.config.window.bordered(),
			completion = {
				winblend = 10,
			},
			documentation = {
				winblend = 10,
			}
		},

		sources = {
			{ name = 'buffer' },
		},
	})

	-- To make cmp work in cmdwin
	cmp.setup.filetype("vim", {
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{ name = "cmdline" }
		}, {
			{ name = "buffer" }
		}),
	})

	cmp.setup.cmdline(':', {
		-- mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = 'path' }
		}, {
			{ name = 'cmdline' }
		})
	})

	require("plugins.nvim-cmp.mappings")
end

return M
