local wezterm = require("wezterm")
local config = {}

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

-- Leader key is `CTRL+b`.
config.leader = {
	key = "b",
	mods = "CTRL",
	timeout_milliseconds = 2000,
}

-- Leader activated keys.

-- Copy mode.
table.insert(config.keys, {
	key = "[",
	mods = "LEADER",
	action = wezterm.action.ActivateCopyMode,
})

-- Close current pane
table.insert(config.keys, {
	key = "w",
	mods = "LEADER|CTRL",
	action = wezterm.action.CloseCurrentPane({ confirm = true }),
})

config.color_scheme = "Tokyo Night Storm"
config.tab_bar_at_bottom = false
config.use_fancy_tab_bar = false
config.window_decorations = "RESIZE"
config.font_size = 11.0
config.warn_about_missing_glyphs = true
config.enable_scroll_bar = true
config.switch_to_last_active_tab_when_closing_tab = true

-- Windows configs.
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	config.font = wezterm.font("Cascadia Code PL")
end

return config
