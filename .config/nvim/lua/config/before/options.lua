vim.cmd([[
	set number
	set relativenumber

	set ignorecase

	set tabstop=4
	set shiftwidth=4

	set clipboard=unnamedplus
]])

vim.opt.fillchars = { eob = ' ' }

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
