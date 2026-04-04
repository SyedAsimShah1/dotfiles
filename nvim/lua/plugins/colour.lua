return {
	-- "AlexvZyl/nordic.nvim",
	-- lazy = false,
	-- priority = 1000,
	-- config = function()
	-- 	require("nordic").load({
	-- 		cursorline = {
	-- 			theme = "light",
	-- 		},
	-- 	})
	--
	-- end,
	-- "rebelot/kanagawa.nvim",
	-- lazy = false,
	-- priority = 1000,
	-- config = function()
	-- 	require("kanagawa").setup()
	-- 	vim.cmd("colorscheme kanagawa-wave")
	-- end,

	-- "sho-87/kanagawa-paper.nvim",
	-- lazy = false,
	-- priority = 1000,
	-- config = function()
	-- 	require("kanagawa-paper").setup()
	-- 	vim.cmd("colorscheme kanagawa-paper")
	-- end,
	-- "uloco/bluloco.nvim",
	-- lazy = false,
	-- priority = 1000,
	-- dependencies = { "rktjmp/lush.nvim" },
	-- config = function()
	-- 	require("bluloco").setup({
	-- 		italics = true,
	-- 		transparent = true,
	-- 	})
	-- 	vim.cmd("colorscheme bluloco")
	-- end,
	--

	"sainnhe/sonokai",
	lazy = false,
	priority = 1000,
	config = function()
		-- vim.g.sonokai_style = "andromeda"
		-- Optionally configure and load the colorscheme
		-- directly inside the plugin declaration.
		vim.g.sonokai_enable_italic = true
		vim.g.sonokai_style = "maia"
		-- vim.g.sonokai_transparent_background = 2
		vim.cmd.colorscheme("sonokai")
	end,

	-- "Koalhack/darcubox-nvim",
	-- config = function()
	-- 	require("darcubox").setup({
	-- 		options = {
	-- 			transparent = false,
	-- 		},
	-- 	})
	-- 	vim.cmd.colorscheme("darcubox")
	--
	-- "sainnhe/everforest",
	-- lazy = false,
	-- priority = 1000,
	-- config = function()
	-- 	-- Optionally configure and load the colorscheme
	-- 	-- directly inside the plugin declaration.
	-- 	vim.g.everforest_enable_italic = true
	-- 	vim.cmd.colorscheme("everforest")
	-- end,

	-- Lazy
	-- "olimorris/onedarkpro.nvim",
	-- priority = 1000, -- Ensure it loads first
	-- config = function()
	-- 	vim.cmd("colorscheme onedark_vivid")
	-- end,

	-- "sho-87/kanagawa-paper.nvim",
	-- lazy = false,
	-- priority = 1000,
	-- opts = {},
	-- config = function()
	-- 	vim.cmd.colorscheme("kanagawa-paper")
	-- end,

	-- "scottmckendry/cyberdream.nvim",
	-- lazy = false,
	-- priority = 1000,
	-- config = function()
	-- 	vim.cmd.colorscheme("cyberdream")
	-- end,

	-- "rebelot/kanagawa.nvim",
	-- lazy = false,
	-- priority = 1000,
	-- config = function()
	-- 	vim.cmd.colorscheme("kanagawa")
	-- end,
}
