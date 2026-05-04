return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "v3.x",
	---@module 'neo-tree'
	---@type neotree.Config
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	lazy = false,
	keys = {
		{ "\\", ":Neotree reveal<CR>", { desc = "NeoTree reveal" } },
	},
	opts = {
		filesystem = {
			window = {
				mappings = {
					["\\"] = "close_window",
					["<c-i>"] = "toggle_preview",
				},
			},
		},
	},
}
