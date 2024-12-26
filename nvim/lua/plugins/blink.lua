return {
	"saghen/blink.cmp",
	dependencies = "rafamadriz/friendly-snippets",
	version = "v0.*",

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = { preset = "super-tab" },
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
	},
	opts_extend = { "sources.default" },
}
