{
  pkgs,
  config,
  lib,
  outputs,
  ...
}: let
  ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in {
  users.mutableUsers = false;
  users.users.will = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "Will";
    initialPassword = "nixos";
    extraGroups =
      [
        "wheel"
        "video"
        "audio"
        "input"
        "networkmanager"
      ]
      ++ ifTheyExist [
        "network"
        "git"
        "libvirtd"
      ];

    uid = 1000;
    packages = [pkgs.home-manager];
  };

  home-manager.users.will = import ../../../home/will;
}
