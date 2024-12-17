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
					max_width = 150,
					-- max_height = 40,
					border = "rounded",
					win_options = {
						winblend = 10,
					},
				},
			})

			-- Open parent directory in current window
			vim.keymap.set("n", "<space>-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

			-- Open parent directory in floating window
			vim.keymap.set("n", "-", require("oil").toggle_float)

			-- vim.api.nvim_create_autocmd("User", {
			-- 	pattern = "OilEnter",
			-- 	callback = vim.schedule_wrap(function(args)
			-- 		local oil = require("oil")
			-- 		if vim.api.nvim_get_current_buf() == args.data.buf and oil.get_cursor_entry() then
			-- 			oil.open_preview()
			-- 		end
			-- 	end),
			-- })
		end,
	},
}
