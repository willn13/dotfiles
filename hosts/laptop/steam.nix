{ config, pkgs, ... }:



{

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

  
environment.systemPackages = with pkgs; [
  # wine
    wineWowPackages.stable
     (wine.override {wineBuild = "wine64";})
     winetricks
   ];


}