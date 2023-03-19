{
  config,
  pkgs,
  ...
}: let
  inherit (config.colorscheme) colors;
in {
  programs.alacritty = {
    enable = true;

    settings = {
      env.TERM = "xterm-256color";

      font = {
        normal = {
          family = "monospace";
          style = "Regular";
        };

        bold = {
          family = "monospace";
          style = "Bold";
        };

        size = 11;
      };

      window = {
        dimensions = {
          columns = 82;
          lines = 24;
        };

        dynamic_padding = true;
        dynamic_title = false;
        decorations_theme_variant = "Dark";
        opacity = 1.0;

        padding = {
          x = 20;
          y = 20;
        };
      };

      cursor.style = "Beam";
      draw_bold_text_with_bright_colors = true;

      colors = {
        primary = {
          background = "0x${colors.base00}";
          foreground = "0x${colors.base05}";
        };

        normal = {
          black = "0x${colors.base01}";
          red = "0x${colors.base08D}";
          green = "0x${colors.base0BD}";
          yellow = "0x${colors.base0AD}";
          blue = "0x${colors.base0DD}";
          magenta = "0x${colors.base0ED}";
          cyan = "0x${colors.base0CD}";
          white = "0x${colors.base06}";
        };

        bright = {
          black = "0x${colors.base02}";
          red = "0x${colors.base08}";
          green = "0x${colors.base0B}";
          yellow = "0x${colors.base0A}";
          blue = "0x${colors.base0D}";
          magenta = "0x${colors.base0E}";
          cyan = "0x${colors.base0C}";
          white = "0x${colors.base07}";
        };
      };
    };
  };
}
