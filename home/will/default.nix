{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./home.nix
    ./packages.nix
    ./programming.nix
    ./devenv.nix

    # Visuals
    ./modules/desktop/gtk.nix
    ./modules/colorschemes

    # Shell Config
    ./modules/shell

    # Lockscreen
    ./modules/desktop/lock.nix

    # Awesome WM files
    ./modules/desktop/windowManagers/awesome

    # Program Configs:

    # MPD
    ./modules/desktop/mpd.nix
    # Zellij
    ./modules/programs/zellij.nix
    # Btop
    ./modules/programs/btop.nix
    # Nvim Config
    ./modules/programs/nvim
    # Alacritty
    ./modules/programs/alacritty.nix
    # Firefox
    ./modules/programs/firefox.nix
    #VSCode
    ./modules/programs/vscode.nix
    # MPV
    ./modules/programs/mpv.nix
    # Zathura
    ./modules/programs/zathura.nix
    # LF
    ./modules/programs/lf.nix

    # Wezterm
    (import ./modules/programs/wezterm {inherit builtins;})
    # Kitty
    (import ./modules/programs/kitty {inherit config pkgs;})

    # Hyprland
    # (import ./modules/desktop/wayland {inherit pkgs;})
    # inputs.hyprland.homeManagerModules.default
  ];
}
