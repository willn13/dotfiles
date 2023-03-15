{ config, ... }:
let inherit (config.colorscheme) colors;
in {
  programs.zathura = {
    enable = true;
    options = {
       window-title-basename = "true";
       selection-clipboard = "clipboard";
       notification-error-fg = "#${colors.base05}";
       notification-warning-fg = "#${colors.base0ZA}";
       notification-bg = "#${colors.base00}";
       notification-fg = "#${colors.base05}";
       completion-bg = "#${colors.base00}";
       completion-group-bg = "#${colors.base00}";
       completion-highlight-bg = "#${colors.base0ZA}";
       completion-highlight-fg = "#${colors.base05}";
       index-bg = "#${colors.base00}";
       index-fg = "#${colors.base05}";
       index-active-fg = "#${colors.base05}";
       inputbar-bg = "#${colors.base00}";
       inputbar-fg = "#${colors.base05}";
       statusbar-bg = "#${colors.base00}";
       statusbar-fg = "#${colors.base05}";
       highlight-color = "#${colors.base0ZB}";
       highlight-active-color = "#${colors.base05}";
       default-bg = "#${colors.base00}";
       default-fg = "#${colors.base05}";
       render-loading = true;
       render-loading-fg = "#${colors.base00}";
       render-loading-bg = "#${colors.base05}";
       recolor-lightcolor = "#${colors.base00}";
       recolor-darkcolor = "#${colors.base05}";
       adjust-open = "width";
       recolor = true;
    };
  };
}