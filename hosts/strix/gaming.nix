{config, pkgs, ... }:

{

  # Enable Steam (Currently disabled cause using Flatpak Steam)
programs.steam = {
  enable = true;
  remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
};

nixpkgs.config.packageOverrides = pkgs: {
 steam = pkgs.steam.override {
   extraPkgs = pkgs: with pkgs; [
      libgdiplus
    ];
  };
};

  # Enable Controllers for Games 
hardware.steam-hardware.enable = true;

environment.systemPackages = with pkgs; [
  protonup-qt
  gamescope
  mangohud
  gamemode
  bottles
  lutris
  wineWowPackages.staging
  winetricks
  ];


}