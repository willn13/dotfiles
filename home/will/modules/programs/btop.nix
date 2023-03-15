  {
  config,
  pkgs,
  inputs,
  ...
}: {

    xdg.configFile."btop".source = ./btop;

}