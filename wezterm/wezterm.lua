local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.default_domain = "WSL:Ubuntu"
config.default_cwd = "~"

config.color_scheme = "Gruvbox Dark (Gogh)"
config.font = wezterm.font_with_fallback({ "IosevkaTerm Nerd Font", "Fira Code" })
config.font_size = 14

config.window_background_opacity = 0.90
config.window_decorations = "RESIZE"
config.window_close_confirmation = "AlwaysPrompt"
config.default_workspace = "main"

config.mouse_bindings = {
	-- Ctrl-click will open the link under the mouse cursor
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = wezterm.action.OpenLinkAtMouseCursor,
	},
}

config.enable_tab_bar = false
config.max_fps = 240
config.animation_fps = 240

return config
