return {
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup({
				columns = { "icon" },
				keymaps = {
					["<C-h>"] = false,
					["<C-l>"] = false,
					["<C-k>"] = false,
					["<C-j>"] = false,
					["<M-h>"] = "actions.select_split",
				},
				view_options = {
					show_hidden = true,
				},
				float = {
					-- Padding around the floating window
					padding = 2,
					max_width = 90,
					max_height = 40,
					-- border = "rounded",
					win_options = {
						winblend = 40,
					},
				},
			})

			-- Open parent directory in current window
			vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

			-- Open parent directory in floating window
			vim.keymap.set("n", "<space>-", require("oil").toggle_float)
		end,
	},
}
