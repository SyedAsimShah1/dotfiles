local themes = {
	{
		"ellisonleao/gruvbox.nvim",
		name = "gruvbox",
	},
	{
		"rebelot/kanagawa.nvim",
		name = "kanagawa",
		opts = { theme = "wave" },
	},
	{
		"sho-87/kanagawa-paper.nvim",
		name = "kanagawa-paper",
		opts = {},
	},
	{
		"sainnhe/sonokai",
		name = "sonokai",
		init = function()
			vim.g.sonokai_enable_italic = true
			vim.g.sonokai_style = "maia"
		end,
	},
	{
		"sainnhe/everforest",
		name = "everforest",
		init = function()
			vim.g.everforest_enable_italic = true
		end,
	},
	{
		"AlexvZyl/nordic.nvim",
		name = "nordic",
		opts = {
			cursorline = {
				theme = "light",
			},
		},
	},
	{
		"uloco/bluloco.nvim",
		name = "bluloco",
		dependencies = { "rktjmp/lush.nvim" },
		opts = {
			italics = true,
		},
	},
	{
		"Koalhack/darcubox-nvim",
		name = "darcubox",
		config = function()
			require("darcubox").setup({ options = { transparent = false } })
		end,
	},
	{
		"olimorris/onedarkpro.nvim",
		name = "onedark_vivid",
	},
	{
		"scottmckendry/cyberdream.nvim",
		name = "cyberdream",
	},
}

for _, theme in ipairs(themes) do
	theme.lazy = true
	theme.priority = 1000
	theme.event = nil
end

local theme_file = vim.fn.stdpath("data") .. "/.theme"

local function save_theme(name)
	local f = io.open(theme_file, "w")
	if f then
		f:write(name)
		f:close()
	end
end

local function load_theme()
	local f = io.open(theme_file, "r")
	if f then
		local name = f:read("*l")
		f:close()
		return name
	end
end

local currentTheme = load_theme() or "gruvbox"

local function set_theme(name)
	require("lazy").load({ plugins = { name } })
	vim.cmd.colorscheme(name)
	require("lualine").setup({})
end

vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	once = true,
	callback = function()
		set_theme(currentTheme)
	end,
})

vim.keymap.set("n", "<leader>ct", function()
	local sorted = {}
	for _, t in ipairs(themes) do
		if t.name == currentTheme then
			table.insert(sorted, 1, t.name)
		else
			table.insert(sorted, t.name)
		end
	end

	local numbered = {}
	for i, name in ipairs(sorted) do
		table.insert(numbered, string.format("%2d. %s", i, name))
	end

	require("fzf-lua").fzf_exec(numbered, {
		prompt = "Theme> ",
		winopts = { height = 0.4, width = 0.3 },
		preview = function(entry)
			local name = entry[1]:match("^%s*%d+%.%s+(.+)$")
			set_theme(name)
			return {}
		end,
		actions = {
			["default"] = function(selected)
				if selected and selected[1] then
					local name = selected[1]:match("^%s*%d+%.%s+(.+)$")
					set_theme(name)
					save_theme(name)
					currentTheme = name
				end
			end,
		},
	})
end, { desc = "UI: Select Theme" })
return themes
