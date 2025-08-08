-- OPTIONS
vim.opt.ignorecase = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.linebreak = true

vim.opt.clipboard:append("unnamedplus")

vim.opt.fillchars = { eob = ' ' }

vim.opt.showmode = false

vim.o.shortmess = vim.o.shortmess .. "I"

vim.opt.laststatus = 0

-- Set oldfiles limit to 10000
vim.opt.shada = string.gsub(vim.o.shada, "'%d+", "'10000", 1)

vim.wo.foldlevel = 20
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

vim.opt.termguicolors = true

-- Filetype detection
vim.filetype.add({
	filename = {
		["colors-hypr.conf"] = "hyprlang",
		["aliases"] = "bash",
		["functions"] = "bash",
	},
	pattern = {
		[".*/hypr/.*%.conf"] = "hyprlang",
		[".*/cava/config"] = "dosini",
		[".*%.rasi"] = "rasi",
		[".*%.h"] = "c",
		[".*/uwsm/env.*"] = "sh",
	},
})
