return {
	"windwp/nvim-autopairs",
	enabled = true,
	event = "InsertEnter",
	-- Optional dependency
	config = function()
		require("nvim-autopairs").setup({})
	end,
}
