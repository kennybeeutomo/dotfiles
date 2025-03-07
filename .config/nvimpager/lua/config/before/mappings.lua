local utils = require("utils")

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'
local set = vim.keymap.set

-- General
set("n", "<leader>qq", "<cmd>qa!<cr>", { desc = "Quit All" })
set("n", "<leader>qw", "<cmd>wqa!<cr>", { desc = "Save and quit All" })
set("n", "<C-q>", "<cmd>q<cr>", { desc = "Quit" })
set("n", "<C-p>", "<cmd>q<cr>", { desc = "Quit" })

-- Navigation
set({"n", "v"}, "j", "gj")
set({"n", "v"}, "k", "gk")
set({"n", "v"}, "d", "<C-d>")
set({"n", "v"}, "u", "<C-u>")
set({"n", "v"}, "<C-l>", "zL")
set({"n", "v"}, "<C-h>", "zH")

-- Options
set("n", "<leader>tw", function()
	vim.o.wrap = not vim.o.wrap
end, { desc = "Toggle Wrapping" })

-- Selection
set("n", "<leader>a", "ggVG", { desc = "Select all" })

-- Search
set("n", "<esc>", "<cmd>noh<cr>")
set("n", "?", "q/")

-- WhichKey
set("n", "g?", "<cmd>WhichKey<cr>")

-- Command Mode
set("n", ";", "q:i", { desc = "Open command mode in vim mode" })

-- pywal16
set("n", "<leader>pw", utils.refreshpywal, { desc = "Reload pywal16" })
