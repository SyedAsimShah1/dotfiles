return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"otavioschwanck/arrow.nvim",
	},

	opts = function()
		local arrow_status = require("arrow.statusline")

		local function arrow()
			return arrow_status.text_for_statusline_with_icons()
		end

		-- LSP client names
		local function lsp()
			local clients = vim.lsp.get_clients({ bufnr = 0 })
			if #clients == 0 then
				return ""
			end
			local names = {}
			for _, c in ipairs(clients) do
				table.insert(names, c.name)
			end
			return " " .. table.concat(names, ", ")
		end

		local winbar = {
			lualine_a = { { "filename", path = 1, symbols = { modified = "[+]", readonly = "" } } },
			lualine_b = { arrow },
		}

		return {
			options = {
				theme = "auto",
				globalstatus = true,
			},
			sections = {
				lualine_b = { arrow },
				lualine_c = { { "filename", path = 1, symbols = { modified = "[+]", readonly = "" } } },
				lualine_x = {
					lsp,
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						symbols = { error = "E:", warn = "W:", info = "I:", hint = "H:" },
					},
				},
				lualine_y = { "branch" },
			},

			winbar = winbar,
			inactive_winbar = winbar,
		}
	end,
}
