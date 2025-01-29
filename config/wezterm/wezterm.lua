local wezterm = require("wezterm")
local config = {}
local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")

config.keys = {}

-- Change tab
for i = 1, 8 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "ALT",
		action = wezterm.action.ActivateTab(i - 1),
	})
end

-- Rename tab
table.insert(config.keys, {
	key = "e",
	mods = "CTRL|SHIFT",
	action = wezterm.action.PromptInputLine({
		description = "Enter new name for tab",
		action = wezterm.action_callback(function(window, pane, line)
			if line then
				window:active_tab():set_title(line)
			end
		end),
	}),
})

-- Move tab left
table.insert(config.keys, {
	key = "LeftArrow",
	mods = "ALT|SHIFT",
	action = wezterm.action.MoveTabRelative(-1),
})

-- Move tab right
table.insert(config.keys, {
	key = "RightArrow",
	mods = "ALT|SHIFT",
	action = wezterm.action.MoveTabRelative(1),
})

-- Close current pane
table.insert(config.keys, {
	key = "w",
	mods = "CTRL",
	action = wezterm.action.CloseCurrentPane({ confirm = true }),
})

config.color_scheme = "tokyonight_storm"
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.window_decorations = "RESIZE"
config.font_size = 13.0
config.warn_about_missing_glyphs = false
-- config.window_background_opacity = 0.95

smart_splits.apply_to_config(config)

return config
