local menubar = require "menubar"

terminal = "wezterm"
explorer = "pcmanfm"
browser = "firefox"
launcher = "rofi -show drun"
editor = os.getenv("EDITOR") or "nvim"
visual_editor = "/usr/lib/sublime_text/sublime_text" -- vscode
editor_cmd = terminal .. " -e " .. editor
modkey = "Mod4" -- super, the windows key

-- Set the terminal for applications that require it
menubar.utils.terminal = terminal
