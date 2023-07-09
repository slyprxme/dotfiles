local wt = require("wezterm")

-- This table will hold the configuration.
local config = {
	font = wt.font({
		family = "CaskaydiaCove Nerd Font",
		weight = "Bold",
		harfbuzz_features = { "liga = 1" },
	}),
	line_height = 1.1,
	font_size = 11.5,
	cell_width = 1,
	bold_brightens_ansi_colors = "BrightAndBold",
	disable_default_key_bindings = true,
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	enable_tab_bar = false,
	tab_bar_at_bottom = false,
	window_background_opacity = 0.95,
	alternate_buffer_wheel_scroll_speed = 6,
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- Colorscheme:
	colors = {
		cursor_bg = "#34c6ff",
		background = "#23262E",
		foreground = "#1CBC9B",
		ansi = {
			"#1c1f24", -- black
			"#fb3f3e", -- red
			"#80c721", -- green
			"#f07721", -- yellow
			"#008ff1", -- blue
			"#c678dd", -- magenta
			"#38b5de", -- cyan
			"#202328", -- white
		},
		brights = {
			"#5b6268", -- bright-black
			"#ec4e0f", -- bright-red
			"#1bc4d1", -- bright-green
			"#ecbe7b", -- bright-yellow
			"#3071db", -- bright-blue
			"#a9a1e1", -- bright-magenta
			"#00d5d5", -- bright-cyan
			"#dfdfdf", -- bright-white
		},
	},
	term = "xterm-256color",
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--Cursor:
	cursor_blink_ease_in = "Constant",
	cursor_blink_ease_out = "Constant",
	cursor_blink_rate = 500,
	default_cursor_style = "BlinkingBar",
	front_end = "OpenGL",
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	window_close_confirmation = "NeverPrompt",
	window_padding = {
		left = 4,
		right = 0,
		top = 4,
		bottom = "0cell",
	},
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	keys = {
		{ key = "-", mods = "CTRL", action = wt.action.DecreaseFontSize },
		{ key = "+", mods = "CTRL", action = wt.action.IncreaseFontSize },
	},
}

return config
