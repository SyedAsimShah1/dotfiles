return {
	{ "tpope/vim-sleuth" }, -- Detect tabstop and shiftwidth automatically

	-- "gc" to comment visual regions/lines
	{ "numToStr/Comment.nvim", opts = {} },

	-- { -- Adds git related signs to the gutter, as well as utilities for managing changes
	-- 	"lewis6991/gitsigns.nvim",
	-- 	opts = {
	-- 		signs = {
	-- 			add = { text = "+" },
	-- 			change = { text = "~" },
	-- 			delete = { text = "_" },
	-- 			topdelete = { text = "‾" },
	-- 			changedelete = { text = "~" },
	-- 		},
	-- 	},
	-- },

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
}
