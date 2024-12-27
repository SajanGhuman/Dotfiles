-- Pull in the wezterm API
local wezterm = require 'wezterm'
local mux = wezterm.mux

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.font_size = 14
config.font = wezterm.font("Maple Mono")
config.color_scheme = 'Gruvbox Material (Gogh)'
config.hide_tab_bar_if_only_one_tab = true

-- Set window padding to 0 to remove borders
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.max_fps = 144

-- Set window transparency
config.window_background_opacity = 0.9  -- Set this value between 0.0 and 1.0 for transparency

wezterm.on('gui-startup', function()
  local tab, pane, window = mux.spawn_window({})
  local gui_window = window:gui_window()
  gui_window:perform_action(wezterm.action.ToggleFullScreen, pane)
end)

-- and finally, return the configuration to wezterm
return config

