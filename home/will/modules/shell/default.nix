{
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [
    ./xdg.nix
    ./cli.nix
    ./git.nix
    ./nix.nix
    ./starship.nix
    ./zsh.nix
    ./fish.nix
  ];

  home = {
    sessionPath = [
      "${config.home.homeDirectory}/.local/bin"
    ];
  };
}
