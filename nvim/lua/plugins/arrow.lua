return {
	"otavioschwanck/arrow.nvim",
	dependencies = {
		"echasnovski/mini.icons",
	},
	---@type arrow.Config
	opts = {
		show_icons = true,
		leader_key = ";", -- Global bookmarks
		buffer_leader_key = "m", -- Per-buffer bookmarks
	},
	keys = {
		{
			"H",
			function()
				require("arrow.persist").previous()
			end,
			desc = "Arrow: Previous Bookmark",
		},
		{
			"L",
			function()
				require("arrow.persist").next()
			end,
			desc = "Arrow: Next Bookmark",
		},
	},
}
