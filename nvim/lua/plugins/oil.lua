return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	dependencies = { "nvim-mini/mini.icons" },
	keys = {
		{ "<leader>-", "<CMD>Oil<CR>", desc = "Open parent directory" },
		{
			"-",
			function()
				require("oil").toggle_float()
			end,
			desc = "Oil Float",
		},
	},
	opts = {
		columns = { "icon" },
		keymaps = {
			["<C-h>"] = false,
			["<C-l>"] = false,
			["<C-k>"] = false,
			["<C-j>"] = false,
			["<M-h>"] = "actions.select_split",
			["<C-v>"] = { "actions.select", opts = { vertical = true } },
		},
		view_options = {
			show_hidden = true,
		},
		float = {
			padding = 2,
			max_width = 150,
			border = "rounded",
			win_options = {
				winblend = 10,
			},
		},
	},
	lazy = false,
}
