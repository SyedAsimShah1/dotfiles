return {
	{ "karb94/neoscroll.nvim", opts = {} },
	{ "windwp/nvim-autopairs", event = "InsertEnter", config = true },
	{ "tpope/vim-sleuth" }, -- Detect tabstop and shiftwidth automatically
	{ "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" }, opts = {} },
	{ "nvim-treesitter/nvim-treesitter-context" },
	{ "bullets-vim/bullets.vim" },
	{ "kevinhwang91/nvim-bqf", event = "VeryLazy", opts = {} },
	{ "sphamba/smear-cursor.nvim", opts = {} },
	{ "numToStr/Comment.nvim", opts = {} },
	{ "stevearc/quicker.nvim", ft = "qf", opts = {} },
	{ "nvim-mini/mini.surround", opts = {}, version = false },
	{ "nvim-mini/mini.ai", opts = {}, version = false },
	{ "OXY2DEV/markview.nvim", lazy = false, dependencies = { "saghen/blink.cmp" } },
	{ "selimacerbas/markdown-preview.nvim", dependencies = { "selimacerbas/live-server.nvim" } },
	{ "folke/which-key.nvim", event = "VeryLazy", opts = {} },
	{
		"windwp/nvim-ts-autotag",
		opts = {
			opts = {
				enable_close = true,
				enable_rename = true,
				enable_close_on_slash = false,
			},
			per_filetype = { html = { enable_close = false } },
		},
	},
}
