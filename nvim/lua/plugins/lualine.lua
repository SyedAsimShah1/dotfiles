return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "otavioschwanck/arrow.nvim" },
	config = function()
		local function arrow()
			local ret = require("arrow.statusline").text_for_statusline_with_icons()
			return ret
		end
		require("lualine").setup({
			options = { theme = "base16" },
			sections = {
				lualine_c = { arrow, { "filename", path = 1 } },
			},
			winbar = {
				lualine_a = { { "filename", path = 1 }, arrow },
			},
			inactive_winbar = {
				lualine_a = { { "filename", path = 1 }, arrow },
			},
		})
	end,
}
