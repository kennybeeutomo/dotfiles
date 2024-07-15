vim.g.mapleader = ' '
local keymap = vim.keymap

-- General
keymap.set("n", "<leader>qq", "<cmd>qa!<cr>", { desc = "Quit All" })
keymap.set("n", "<leader>qw", "<cmd>wqa!<cr>", { desc = "Save and quit All" })

-- Buffers
keymap.set("n", "<leader>qb", "<cmd>bd<cr>", { desc = "Delete buffer" })

-- NvimTree
keymap.set("n", "<leader>e", "<cmd>NvimTreeFocus<cr>", { desc = "Focus NvimTree" })
keymap.set("n", "<leader>n", "<cmd>NvimTreeClose<cr>", { desc = "Close NvimTree" })
keymap.set("n", "<leader>cd", "<cmd>cd %:h<cr>", { desc = "cd to directory of current file" })

-- Beautifier
keymap.set("n", "<leader>s", "T{i<cr><esc>t}a<cr><esc>", { desc = "Expand curly braces" })

-- Terminal
keymap.set("n", "<M-v>", "<cmd>ToggleTerm direction=vertical size=60<cr>", { desc = "Show terminal vertically" })
keymap.set("n", "<M-h>", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Show terminal horizontally" })
keymap.set("n", "<M-n>", "<cmd>ToggleTerm direction=tab<cr>", { desc = "Show terminal in a tab" })
keymap.set("t", "<M-v>", "<cmd>ToggleTerm<cr>", { desc = "Hide terminal" })
keymap.set("t", "<M-h>", "<cmd>ToggleTerm<cr>", { desc = "Hide terminal" })
keymap.set("t", "<M-n>", "<cmd>ToggleTerm<cr>", { desc = "Hide terminal" })

-- Windows
keymap.set("n", "<leader>wv", "<C-w>v", { desc = "New vertical window" })
keymap.set("n", "<leader>wh", "<C-w>s", { desc = "New horizontal window" })

-- Colorizer
keymap.set("n", "<leader>ct", "<cmd>ColorizerToggle<cr>", { desc = "Toggle Colorizer" })
keymap.set("n", "<leader>cr", "<cmd>ColorizerReloadAllBuffers<cr>", { desc = "Reload Colorizer" })

-- Selection
keymap.set("n", "<leader>a", "ggVG", { desc = "Select all" })

-- Telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr><esc>", { desc = "Find files" })
keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<cr><esc>", { desc = "Old files" })
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr><esc>", { desc = "Buffers" })

-- Fold
keymap.set("n", "<leader>o", "zo", { desc = "Open fold" })
keymap.set("n", "<leader>O", "zc", { desc = "Close fold" })

-- Markdown Preview
keymap.set("n", "<leader>md", "<cmd>MarkdownPreviewToggle<cr>", { desc = "Preview Markdown" })

-- LSP
keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP: Go to definition" })
keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "LSP: Go to declaration" })
keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP: Hover" })
keymap.set("n", "gr", vim.lsp.buf.references, { desc = "LSP: References" })
keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "LSP: Signature help" })

-- Format
keymap.set("n", "<leader>\\f", function()
	local file = vim.api.nvim_buf_get_name(0)
	vim.cmd("!clang-format -i " .. file)
end, { desc = "clang-format current file" })

-- Search
keymap.set("n", "<esc>", "<cmd>noh<cr>")

-- WhichKey
keymap.set("n", "\\", "<cmd>WhichKey<cr>")

