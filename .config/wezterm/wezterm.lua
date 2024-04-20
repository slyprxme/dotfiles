local wt = require("wezterm")

-- This table will hold the configuration.
local config = {
	font = wt.font({
		family = "ComicPro",
		-- family = "ComicCode Ligatures",
		weight = "Bold",
		harfbuzz_features = { "liga = 1" },
	}),
	line_height = 1.1,
	font_size = 10.5,
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
		foreground = "#edeff0",
		background = "#0c0e0f",
		cursor_bg = "#edeff0",
		cursor_fg = "#edeff0",
		cursor_border = "#232526",
		selection_fg = "#0c0e0f",
		selection_bg = "#edeff0",
		scrollbar_thumb = "#edeff0",
		split = "#090909",
		ansi = { "#232526", "#df5b61", "#78b892", "#de8f78", "#6791c9", "#bc83e3", "#67afc1", "#e4e6e7" },
		brights = { "#2c2e2f", "#e8646a", "#81c19b", "#e79881", "#709ad2", "#c58cec", "#70b8ca", "#f2f4f5" },
		indexed = { [136] = "#edeff0" },
		tab_bar = {
			active_tab = {
				bg_color = "#0c0e0f",
				fg_color = "#edeff0",
				italic = true,
			},
			inactive_tab = { bg_color = "#090909", fg_color = "#0c0e0f" },
			inactive_tab_hover = { bg_color = "#151515", fg_color = "#090909" },
			new_tab = { bg_color = "#151515", fg_color = "#090909" },
			new_tab_hover = { bg_color = "#6791c9", fg_color = "#090909" },
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
	check_for_updates = false,
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
