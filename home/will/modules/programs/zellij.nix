  {
  config,
  pkgs,
  inputs,
  ...
}: {

    xdg.configFile."zellij".source = ./zellij;

}