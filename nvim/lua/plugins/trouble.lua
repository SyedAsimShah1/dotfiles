return {
	"folke/trouble.nvim",
	opts = {
		modes = {
			lsp = { -- Configure symbols mode
				win = {
					-- type = "split", -- split window
					relative = "editor", -- relative to current window
					position = "bottom", -- right side
					size = 0.25, -- 30% of the window
				},
			},
			symbols = { -- Configure symbols mode
				win = {
					-- type = "split", -- split window
					relative = "editor", -- relative to current window
					position = "right", -- right side
					size = 0.25, -- 30% of the window
				},
			},
		},
	},
	cmd = "Trouble",
	keys = {
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Diagnostics (Trouble)",
		},
		{
			"<leader>xX",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Buffer Diagnostics (Trouble)",
		},
		{
			"<leader>cs",
			"<cmd>Trouble symbols toggle focus=false<cr>",
			desc = "Symbols (Trouble)",
		},
		{
			"<leader>cl",
			"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
			desc = "LSP Definitions / references / ... (Trouble)",
		},
		{
			"<leader>xL",
			"<cmd>Trouble loclist toggle<cr>",
			desc = "Location List (Trouble)",
		},
		{
			"<leader>xQ",
			"<cmd>Trouble qflist toggle<cr>",
			desc = "Quickfix List (Trouble)",
		},
	},
}
