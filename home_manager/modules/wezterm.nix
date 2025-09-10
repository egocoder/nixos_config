{ pkgs, ... }: {
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      local wezterm = require("wezterm")
      local config = {}

      config.enable_wayland = false

      config.color_scheme = "Builtin Dark+"
      config.font = wezterm.font_with_fallback({
        "Terminess Nerd Font Mono",
        "GohuFont 11 Nerd Font Mono",
      })
      config.font_size = 12.0
      config.window_background_opacity = 0.94
      config.max_fps = 180

      config.window_decorations = "RESIZE"
      config.hide_tab_bar_if_only_one_tab = false
      config.use_fancy_tab_bar = false
      config.tab_max_width = 25
      config.scrollback_lines = 10000
      config.enable_scroll_bar = true
      config.window_close_confirmation = "NeverPrompt"
      config.window_padding = { left = 2, right = 2, top = 0, bottom = 0 }
      config.adjust_window_size_when_changing_font_size = false
      config.audible_bell = "Disabled"
      config.warn_about_missing_glyphs = false
      config.default_cursor_style = "BlinkingBlock"

      config.mouse_bindings = {
        {
          event = { Up = { streak = 1, button = "Left" } },
          mods = "NONE",
          action = wezterm.action.CompleteSelectionOrOpenLinkAtMouseCursor("Clipboard"),
        },
      }

      config.keys = {
        { key = "r", mods = "ALT", action = wezterm.action.ReloadConfiguration },
        { key = "p", mods = "CTRL", action = wezterm.action.ActivateTabRelative(-1) },
        { key = "n", mods = "CTRL", action = wezterm.action.ActivateTabRelative(1) },
        { key = "Enter", mods = "ALT", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
        { key = "w", mods = "ALT", action = wezterm.action.CloseCurrentTab { confirm = true } },

        { key = "1", mods = "ALT", action = wezterm.action.ActivateTab(0) },
        { key = "2", mods = "ALT", action = wezterm.action.ActivateTab(1) },
        { key = "3", mods = "ALT", action = wezterm.action.ActivateTab(2) },
        { key = "4", mods = "ALT", action = wezterm.action.ActivateTab(3) },
        { key = "5", mods = "ALT", action = wezterm.action.ActivateTab(4) },
        { key = "6", mods = "ALT", action = wezterm.action.ActivateTab(5) },
        { key = "7", mods = "ALT", action = wezterm.action.ActivateTab(6) },
        { key = "8", mods = "ALT", action = wezterm.action.ActivateTab(7) },
        { key = "9", mods = "ALT", action = wezterm.action.ActivateTab(8) },

        { key = "LeftArrow",  mods = "ALT", action = wezterm.action.ActivatePaneDirection("Left") },
        { key = "RightArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Right") },
        { key = "UpArrow",    mods = "ALT", action = wezterm.action.ActivatePaneDirection("Up") },
        { key = "DownArrow",  mods = "ALT", action = wezterm.action.ActivatePaneDirection("Down") },

        { key = "LeftArrow",  mods = "ALT|SHIFT", action = wezterm.action.AdjustPaneSize({ "Left", 5 }) },
        { key = "RightArrow", mods = "ALT|SHIFT", action = wezterm.action.AdjustPaneSize({ "Right", 5 }) },
        { key = "UpArrow",    mods = "ALT|SHIFT", action = wezterm.action.AdjustPaneSize({ "Up", 3 }) },
        { key = "DownArrow",  mods = "ALT|SHIFT", action = wezterm.action.AdjustPaneSize({ "Down", 3 }) },

        { key = "s", mods = "ALT", action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" } },
        { key = "v", mods = "ALT", action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" } },

        { key = "c", mods = "ALT", action = wezterm.action.CloseCurrentPane { confirm = true } },
        { key = "q", mods = "ALT", action = wezterm.action.CloseCurrentTab { confirm = true } },
        { key = "Q", mods = "ALT", action = wezterm.action.QuitApplication },
      }

      return config
    '';
  };
}

