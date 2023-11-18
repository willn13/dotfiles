{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {

  imports = [
    inputs.spicetify-nix.homeManagerModule
  ];

  # themable spotify
  programs.spicetify = let
    spicePkgs = inputs.spicetify-nix.packages.${pkgs.hostPlatform.system}.default;
  in {
    enable = true;
    theme = spicePkgs.themes.Ziro;
    customColorScheme = {
      text = "DCD7BA";
      subtext = "C8C093";
      sidebar-text = "E6C384";
      main = "1F1F28";
      sidebar = "1F1F28";
      player = "1F1F28";
      card = "2a2a37";
      shadow = "16161d";
      selected-row = "363646";
      button = "7e9cd8";
      button-active = "7e9cd8";
      button-disabled = "727169";
      tab-active = "7e9cd8";
      notification = "98bb6c";
      notification-error = "e6c384";
      misc = "16161d";
    };

    enabledExtensions = with spicePkgs.extensions; [
      fullAppDisplay
      hidePodcasts
      shuffle
      skipStats
      autoVolume
      autoSkip
      savePlaylists
      phraseToPlaylist
      wikify
      autoSkip
      copyToClipboard
      history
      groupSession
      loopyLoop
      trashbin
      bookmark
      keyboardShortcut
      fullAppDisplayMod
      # i aint paying for shit
      adblock
    ];
    enabledCustomApps = with spicePkgs.apps; [
      reddit
      lyrics-plus
      localFiles
    ];
  };
}