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
				lualine_a = { { "buffers", hide_filename_extension = true } },
				lualine_b = { "filetype", "progress" },
			},
			inactive_winbar = {
				lualine_a = { { "buffers", hide_filename_extension = true } },
				lualine_b = { "filetype", "progress" },
			},
		})
	end,
}
