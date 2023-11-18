{
  config,
  pkgs,
  ...
}: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi.override {
      plugins = [pkgs.rofi-emoji];
    };


    extraConfig = {
      font = "Vanilla Caramel 14";
      show-icons = true;
      terminal = "kitty";
      drun-display-format = "{icon} {name}";
      location = 0;
      disable-history = false;
      hide-scrollbar = true;
      window-format = " [{w}]\t\t{t:0}";
      sidebar-mode = true;
      display-run = "󰜎 Run 󰜎";
      display-drun = "󱓞 Applications 󱓞";
      display-window = "  Tasks  ";
      show-match = false;
      kb-mode-previous = "Alt+h,Control+Shift+Tab";
      kb-mode-next = "Alt+l,Control+Tab";
      kb-row-left = "Control+Alt+h";
      kb-row-right = "Control+Alt+l";
      kb-row-down = "Control+Alt+j,Control+n,Down";
      kb-row-up = "Control+Alt+k,Control+p,Up";
      kb-remove-word-back = "Control+BackSpace";
      modi = "run,drun,window";
    };

    theme = let
      inherit (config.lib.formats.rasi) mkLiteral;
    in {
      "*" = {
        bg-col = mkLiteral "#16161d";
        bg-col-light = mkLiteral "#16161d";
        border-col = mkLiteral "#16161d";
        selected-col = mkLiteral "#16161d";
        randomcolor = mkLiteral "#ff5d62";
        fg-col = mkLiteral "#dcd7ba";
        fg-col2 = mkLiteral "#ff5d62";
        subtext = mkLiteral "#c8c093";
        width = 900;
      };

      "button" = {
          background-color = mkLiteral "@bg-col-light";
          horizontal-align = mkLiteral "0.5";
          padding = mkLiteral "10px";
          text-color = mkLiteral "@subtext";
          vertical-align = mkLiteral "0.5";
      };

      "button selected" = {
          background-color = mkLiteral "@bg-col";
          text-color = mkLiteral "@randomcolor";
      };

      "element" = {
          background-color = mkLiteral "@bg-col";
          padding = mkLiteral "5px";
          text-color = mkLiteral "@fg-col";
      };

      "element-icon" = {
          size = mkLiteral "20px";
      };

      "element selected" = {
          background-color = mkLiteral "@selected-col";
          text-color = mkLiteral "@fg-col2";
      };

      "entry" = {
          background-color = mkLiteral "@bg-col";
          margin = mkLiteral "20px 0px 0px 10px";
          padding = mkLiteral "6px";
          text-color = mkLiteral "@fg-col";
      };

      "inputbar" = {
          background-color = mkLiteral "@bg-col";
          border-radius = mkLiteral "5px";
          children = mkLiteral "[prompt, entry]";
          padding = mkLiteral "2px";
      };

      "listview" = {
          background-color = mkLiteral "@bg-col";
          border = mkLiteral "0px 0px 0px";
          columns = mkLiteral "2";
          margin = mkLiteral "10px 0px 0px 20px";
          padding = mkLiteral "6px 0px 0px";
      };

      "mainbox" = {
          background-color = mkLiteral "@bg-col";
      };

      "mode-switcher" = {
          spacing = 0;
      };

      "prompt" = {
        background-color = mkLiteral "@randomcolor";
        border-radius = mkLiteral "3px";
        margin = mkLiteral "20px 0px 0px 20px";
        padding = mkLiteral "6px";
        text-color = mkLiteral "@bg-col";
    };

      "textbox-prompt-colon" = {
          expand = "false";
          str = ":";
      };

      "window" = {
        background-color = mkLiteral "@bg-col";
        border = mkLiteral "8px";
        border-color = mkLiteral "@border-col";
        height = mkLiteral "500px";
      };

      "element-text, element-icon, mode-switcher" = {
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
      };

    };
  };
}
