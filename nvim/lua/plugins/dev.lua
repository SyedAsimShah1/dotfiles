return {
	-- {
	-- 	dir = "~/repos/quick-todo.nvim",
	-- 	config = function()
	-- 		require("quick-todo").setup({
	-- 			window = {
	-- 				height = 0.5,
	-- 				width = 0.5,
	-- 				winblend = 0,
	-- 			},
	-- 		})
	-- 	end,
	-- },
	{
		"SyedAsimShah1/quick-todo.nvim",
		opts = {
			keys = {
				open = "+",
			},
			window = {
				height = 0.5,
				width = 0.5,
				winblend = 10,
			},
		},
	},
}
