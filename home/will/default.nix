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


    ./modules/colorschemes
    ./modules/shell
    ./modules/desktop/windowManagers/awesome
    ./modules/desktop/nvim
    ./modules/desktop/mpd.nix
    ./modules/desktop/lock.nix
    ./modules/desktop/gtk.nix
    ./modules/programs/alacritty.nix
    ./modules/programs/firefox.nix
 #   ./modules/programs/helix.nix
    ./modules/programs/vscode.nix
    ./modules/programs/mpv.nix
    #./modules/programs/brave.nix
   # ./modules/desktop/xresources.nix
    (import ./modules/programs/wezterm { inherit builtins; })
    (import ./modules/programs/kitty { inherit config pkgs; })

   
  ];

}
