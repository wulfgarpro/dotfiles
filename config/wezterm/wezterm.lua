local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- Set `LEADER` mod to `CTRL+b`.
config.leader = {
	key = "b",
	mods = "CTRL",
	timeout_milliseconds = 2000,
}

config.keys = {
	-- Rename tab title.
	{
		key = "e",
		mods = "ALT|SHIFT",
		action = wezterm.action.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, _, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
	-- Move current tab left.
	{
		key = "LeftArrow",
		mods = "ALT|SHIFT",
		action = wezterm.action.MoveTabRelative(-1),
	},
	-- Move current tab right.
	{
		key = "RightArrow",
		mods = "ALT|SHIFT",
		action = wezterm.action.MoveTabRelative(1),
	},
	-- Activate copy mode.
	{
		key = "[",
		mods = "LEADER",
		action = wezterm.action.ActivateCopyMode,
	},
	-- Close current pane.
	{
		key = "w",
		mods = "LEADER|CTRL",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
}

-- Change to tab number.
for i = 1, 8 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "ALT",
		action = wezterm.action.ActivateTab(i - 1),
	})
end

config.color_scheme = "Tokyo Night Storm"
config.tab_bar_at_bottom = false
config.use_fancy_tab_bar = false
config.window_decorations = "RESIZE"
config.font_size = 11.0
config.warn_about_missing_glyphs = true
config.enable_scroll_bar = true
config.switch_to_last_active_tab_when_closing_tab = true
config.command_palette_font_size = 11.0
config.command_palette_bg_color = "#24283b"
config.command_palette_fg_color = "#c0caf5"

if wezterm.target_triple:find("windows") then
	-- Windows specific configs go here.
end

return config
