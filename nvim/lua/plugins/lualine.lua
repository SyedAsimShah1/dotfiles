return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = { theme = "nordic", globalstatus = true },
			sections = {
				lualine_c = { { "filename", path = 1 } },
			},
			winbar = {
				lualine_a = { { "filename", hide_filename_extension = true } },
			},
			inactive_winbar = {
				lualine_a = { { "filename", hide_filename_extension = true } },
			},
		})
	end,
}
