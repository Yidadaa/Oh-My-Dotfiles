local wezterm = require 'wezterm'

return {
  color_scheme = "Catppuccin Mocha", -- or Macchiato, Frappe, Latte
  font_size = 16.0,
  use_fancy_tab_bar = false,
  font = wezterm.font_with_fallback {
    'JetBrainsMono Nerd Font Mono',
    'Noto Sans Mono CJK SC'
  }
}
