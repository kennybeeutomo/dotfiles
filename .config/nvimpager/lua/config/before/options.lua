local utils = require("utils")

-- OPTIONS
vim.opt.ignorecase = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.clipboard:append("unnamedplus")

vim.opt.fillchars = { eob = ' ' }

vim.opt.showmode = false

-- Set oldfiles limit to 1000
vim.opt.shada = string.gsub(vim.o.shada, "'%d+", "'1000", 1)

vim.wo.foldlevel = 20
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

vim.opt.termguicolors = true

-- Filetype detection
vim.filetype.add({
	pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})
