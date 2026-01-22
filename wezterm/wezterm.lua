require("tab-line")

local wezterm = require("wezterm")

local cfg = {
	color_scheme = "Catppuccin Mocha",
	use_fancy_tab_bar = false,
	tab_bar_at_bottom = true,
	show_new_tab_button_in_tab_bar = false,
	font = wezterm.font({ family = "JetBrainsMono NL Nerd Font" }),
	font_size = 14,
	window_background_opacity = 0.2,

	keys = {
		{
			key = "h",
			mods = "CTRL|SHIFT",
			action = wezterm.action.ActivateTabRelative(-1),
		},

		{
			key = "l",
			mods = "CTRL|SHIFT",
			action = wezterm.action.ActivateTabRelative(1),
		},
	},
}

return cfg
