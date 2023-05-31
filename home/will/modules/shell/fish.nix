{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.fish = {
    enable = true;
    shellInit = ''

      source ${pkgs.vimPlugins.kanagawa-nvim}/extras/kanagawa.fish

      '';
      shellAbbrs = {
        "diff" = "nvim -d";
        "grep" = "rg";
        "vi" = "nvim";

        "sh" = "nix shell";
        "nixh" = "nix-prefetch-url";
        "nixhu" = "nix-prefetch-url --unpack";
      };
      functions = {
        mkcd = "mkdir -p $argv; cd $argv;";
        mktouch = "mkdir -p (dirname $argv); touch $argv;";
      };
  };


}