{ config, pkgs }:

{
  programs.kitty = {
    enable = true;
    extraConfig = import ./settings.nix {inherit config;};
    settings = {
      window_padding_width = 20;
      confirm_os_window_close = 0;
      cursor_shape = "underline";
      cursor_underline_thickness = "0.5";
      background_opacity = "1";
      dynamic_background_opacity = "yes";
      allow_remote_control = "yes";
    };
    font = {
      size = 12;
      name = "monospace";
    };
  };
}
