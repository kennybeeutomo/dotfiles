require("night-owl").setup({
	bold = true,
	italics = true,
	underline = true,
	undercurl = true,
	transparent_background = true,
})

local palette = require("night-owl.palette")
vim.api.nvim_set_hl(0, "@type.builtin", { fg = palette.magenta3, bg = "NONE" })

vim.cmd.colorscheme("night-owl")
