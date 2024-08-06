return {
	{ "tpope/vim-sleuth" }, -- Detect tabstop and shiftwidth automatically

	-- "gc" to comment visual regions/lines
	{ "numToStr/Comment.nvim", opts = {} },
	-- Highlight todo, notes, etc in comments
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},

	{ -- Add indentation guides even on blank lines
		"lukas-reineke/indent-blankline.nvim",
		-- Enable `lukas-reineke/indent-blankline.nvim`
		-- See `:help ibl`
		main = "ibl",
		opts = {},
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^5", -- Recommended
		lazy = false, -- This plugin is already lazy
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
	},
	{
		"leath-dub/snipe.nvim",
		keys = {
			{
				"<leader>ss",
				function()
					require("snipe").open_buffer_menu()
				end,
				desc = "Open Snipe buffer menu",
			},
		},
		opts = {
			ui = {
				position = "center",
			},
			sort = "last",
		},
	},
}
