require("lazy").setup({
	{ "nvim-lua/plenary.nvim" },

	{ "nvim-treesitter/nvim-treesitter", },

	{ "nvim-tree/nvim-web-devicons" },
	{
		"rachartier/tiny-devicons-auto-colors.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons"
		},
		event = "VeryLazy",
		config = function()
			require("plugins.devicons-auto-colors").setup()
		end
	},

	{
		"NvChad/nvim-colorizer.lua",
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
		opts = {},
	},

	{ "oxfist/night-owl.nvim", },
	{ "uZer/pywal16.nvim", },

	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },
	{ "hrsh7th/nvim-cmp" },

	{
		"folke/zen-mode.nvim",
	},
})
