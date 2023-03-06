-- general thanks to the JavaCafe01's dotfiles, which was
-- used as reference to make this config!
local wezterm = require("wezterm")

local function font_with_fallback(name, params)
  local names = {name, "monospace"}
  return wezterm.font_with_fallback(names, params)
end

-- tabbar (stole from JavaCafe01's dotfiles :D)
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local RIGHT_DIVIDER = utf8.char(0xe0bc)
  local active_tab_index = 0
  for _, t in ipairs(tabs) do
    if t.is_active == true then
      active_tab_index = t.tab_index
    end
  end
  local active_bg = config.colors.tab_bar.active_tab.bg_color
  local active_fg = config.colors.tab_bar.active_tab.fg_color
  local inactive_bg = config.colors.tab_bar.inactive_tab.bg_color
  local inactive_fg = config.colors.tab_bar.inactive_tab.fg_color
  local new_tab_bg = config.colors.tab_bar.new_tab.bg_color
  local s_bg, s_fg, e_bg, e_fg
  -- the last tab
  if tab.tab_index == #tabs - 1 then
    if tab.is_active then
      s_bg = active_bg
      s_fg = active_fg
      e_bg = new_tab_bg
      e_fg = active_bg
    else
      s_bg = inactive_bg
      s_fg = inactive_fg
      e_bg = new_tab_bg
      e_fg = inactive_bg
    end
  elseif tab.tab_index == active_tab_index - 1 then
    s_bg = inactive_bg
    s_fg = inactive_fg
    e_bg = active_bg
    e_fg = inactive_bg
  elseif tab.is_active then
    s_bg = active_bg
    s_fg = active_fg
    e_bg = inactive_bg
    e_fg = active_bg
  else
    s_bg = inactive_bg
    s_fg = inactive_fg
    e_bg = inactive_bg
    e_fg = inactive_bg
  end
  return {
    { Background = { Color = s_bg } },
    { Foreground = { Color = s_fg } },
    { Text = " " .. tab.tab_index + 1 .. ": " .. tab.active_pane.title .. " " },
    { Background = { Color = e_bg } },
    { Foreground = { Color = e_fg } },
    { Text = RIGHT_DIVIDER },
  }
end) 

-- begin of the config
local C = {}

-- general
C.front_end = "OpenGL"
C.check_for_updates = false

-- fonts
local font_name = "JetBrainsMono Nerd Font"

C.font = font_with_fallback(font_name)

C.font_rules = {
  {
    italic = true,
    font = font_with_fallback(font_name, { italic = true })
  },
  {
    italic = true,
    intensity = "Bold",
    font = font_with_fallback(font_name, { bold = true, italic = true })
  },
  {
    intensity = "Bold",
    font = font_with_fallback(font_name, { bold = true })
  },
  {
    intensity = "Half",
    font = font_with_fallback(font_name)
  }
}

C.font_size = 10.0
C.line_height = 1.0

-- cursor
C.default_cursor_style = "SteadyUnderline"

-- X is good!
C.enable_wayland = false

-- disable default keybindings
C.disable_default_key_bindings = true

-- new keybindings (thanks to JavaCafe01's dotfiles)
C.keys = {
  {
    mods = "CTRL",
    key = [[;]],
    action = wezterm.action {
      SplitHorizontal = {domain = "CurrentPaneDomain"}
    }
  },
  {
    mods = "CTRL",
    key = [[\]],
    action = wezterm.action {
      SplitVertical = {domain = "CurrentPaneDomain"}
    }
  }, -- browser-like bindings for tabbing
  {
    key = "t",
    mods = "CTRL",
    action = wezterm.action {SpawnTab = "CurrentPaneDomain"}
  },
  {
    key = "w",
    mods = "CTRL",
    action = wezterm.action {CloseCurrentTab = {confirm = false}}
  },
  {
    mods = "CTRL",
    key = "Tab",
    action = wezterm.action {ActivateTabRelative = 1}
  }, {
    mods = "CTRL|SHIFT",
    key = "Tab",
    action = wezterm.action {ActivateTabRelative = -1}
  }, -- standard copy/paste bindings
  {
    key = "x",
    mods = "CTRL",
    action = "ActivateCopyMode"
  },
  {
    key = "v",
    mods = "CTRL|SHIFT",
    action = wezterm.action {PasteFrom = "Clipboard"}
  },
  {
    key = "c",
    mods = "CTRL|SHIFT",
    action = wezterm.action {CopyTo = "ClipboardAndPrimarySelection"}
  }
}

-- colors
C.bold_brightens_ansi_colors = false

C.colors = {
  indexed = {[16] = "#ffa066", [17] = "#ff5d62"},

  scrollbar_thumb = "#727169",
  split = "#c8c093",

  tab_bar = {
    background = "#c8c093",
    active_tab = {
      bg_color = "#c8c093",
      fg_color = "#dcd7ba"
    },
    inactive_tab = {
      bg_color = "#c8c093",
      fg_color = "#dcd7ba"
    },
    inactive_tab_hover = {
      bg_color = "#727169",
      fg_color = "#dcd7ba"
    },
    new_tab = {
      bg_color = "#c8c093",
      fg_color = "#dcd7ba"
    },
    new_tab_hover = {
      bg_color = "#727169",
      fg_color = "#dcd7ba",
      italic = true
    },
  },

  visual_bell = "#727169",

  -- nightbuild only
  compose_cursor = "#ecd3a0",

  -- Theme Colors (Kanagawa)
  foreground = "#dcd7ba",
  background = "#1f1f28",
  cursor_bg = "#c8c093",
  cursor_border = "#c8c093",
  cursor_fg = "#c8c093",
  selection_bg = "#2d4f67",
  selection_fg = "#c8c093",

  ansi = {"#090618", "#c34043", "#76946a", "#c0a36e", "#7e9cd8", "#957fb8", "#6a9589", "#c8c093"},
  brights = {"#727169", "#e82424", "#98bb6c", "#e6c384", "#7fb4ca", "#938aa9", "#7aa89f", "#dcd7ba"},
}

-- Padding
C.window_padding = {left = '40pt', right = '40pt', top = '40pt', bottom = '40pt'}

-- Get rid of close prompt
C.window_close_confirmation = "NeverPrompt"

-- No opacity
C.inactive_pane_hsb = {saturation = 1.0, brightness = 1.0}

-- Tab bar confs
C.enable_tab_bar = true
C.use_fancy_tab_bar = false
C.hide_tab_bar_if_only_one_tab = true
C.show_tab_index_in_tab_bar = false

return C
