return {
	"ibhagwan/fzf-lua",
	init = function()
		require("fzf-lua").register_ui_select()
	end,
	dependencies = { "nvim.mini/mini.icons" },
	---@module "fzf-lua"
	---@type fzf-lua.Config|{}
	---@diagnostic disable: missing-fields
	opts = {
		file_ignore_patterns = {
			"node_modules/.*",
			"%.git/",
			"%.obsidian/",
			"%.stfolder/",
			"%.venv/",
		},
		keymap = {
			builtin = {
				true,
				["<C-b>"] = "preview-page-down",
				["<C-f>"] = "preview-page-up",
			},
			fzf = {
				true,
				["ctrl-u"] = "half-page-up",
				["ctrl-d"] = "half-page-down",
				["ctrl-q"] = "select-all+accept",
			},
		},
	},
	keys = {
		{ "<leader>u", "<cmd>FzfLua undotree<cr>", desc = "Undo Tree" },
		{ "<leader>sh", "<cmd>FzfLua help_tags<cr>", desc = "[S]earch [H]elp" },
		{ "<leader>sk", "<cmd>FzfLua keymaps<cr>", desc = "[S]earch [K]eymaps" },
		{ "<leader>sf", "<cmd>FzfLua files<cr>", desc = "[S]earch [F]iles" },
		{ "<leader>sw", "<cmd>FzfLua grep_cword<cr>", desc = "[S]earch current [W]ord" },
		{ "<leader>sg", "<cmd>FzfLua live_grep<cr>", desc = "[S]earch by [G]rep" },
		{ "<leader>sd", "<cmd>FzfLua diagnostics_workspace<cr>", desc = "[S]earch [D]iagnostics" },
		{ "<leader>sr", "<cmd>FzfLua resume<cr>", desc = "[S]earch [R]esume" },
		{ "<leader>s.", "<cmd>FzfLua oldfiles<cr>", desc = "[S]earch Recent Files" },
		{ "<leader><leader>", "<cmd>FzfLua buffers<cr>", desc = "[ ] Find existing buffers" },
		{ "<leader>/", "<cmd>FzfLua lgrep_curbuf<cr>", desc = "[/] Fuzzily search in current buffer" },
		{
			"<leader>s/",
			function()
				require("fzf-lua").live_grep({ grep_open_files = true })
			end,
			desc = "[S]earch [/] in Open Files",
		},
		{
			"<leader>sn",
			function()
				require("fzf-lua").files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "[S]earch [N]eovim files",
		},
	},
	---@diagnostic enable: missing-fields
}
