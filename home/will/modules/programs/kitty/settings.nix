{config}:

let
  inherit (config.colorscheme) colors;
in with colors;
''


# Special
background #${colors.base00}
foreground #${colors.base05}
# Black
color0 #${colors.base01}
color8 #${colors.base02}
# Red
color1 #${colors.base08D}
color9 #${colors.base08}
# Green
color2  #${colors.base0BD}
color10 #${colors.base0B}
# Yellow
color3  #${colors.base0AD}
color11 #${colors.base0A}
# Blue
color4  #${colors.base0DD}
color12 #${colors.base0D}
# Magenta
color5  #${colors.base0ED}
color13 #${colors.base0E}
# Cyan
color6  #${colors.base0CD}
color14 #${colors.base0C}
# White
color7  #${colors.base06}
color15 #${colors.base07}
# Cursor
cursor #${colors.base06}
cursor_text_color #${colors.base00}
# Selection highlight
selection_foreground #${colors.base05}
selection_background #${colors.base02}
''
