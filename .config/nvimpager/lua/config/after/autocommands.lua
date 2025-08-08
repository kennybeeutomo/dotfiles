local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local utils = require("utils")
local set = vim.keymap.set

local pywal = augroup("pywal", { clear = true })
autocmd({"Signal"}, {
	pattern = "SIGUSR1",
	group = pywal,
	callback = function()
		utils.cleanColorscheme("pywal16")
		-- must :e if filetype is norg
		if (vim.o.ft == "norg") then
			vim.cmd("write")
			vim.cmd("edit")
		end
	end,
	desc = "Reload pywal on SIGUSR1 signal, useful after changing wallpapers"
})

local localMappings = augroup("localMappings", { clear = true })
autocmd({"BufRead"}, {
	pattern = "colors-readable.txt",
	group = localMappings,
	callback = function()
		set("n", "y", "f#ye0", { buffer = true, desc = "Copy color" })
	end,
	desc = "Pywal Colors"
})
