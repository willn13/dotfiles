{
  lib,
  pkgs,
  ...
}: {
  home.packages = lib.attrValues {
    inherit
      (pkgs)

      # Terminals and Tools
      alacritty
      wezterm
      kitty
      tmux
      ueberzug
      tk
      yad

      # Editors
      neovide
      beekeeper-studio
      sublime4
      polkit_gnome

      #CLI Tools
      btop
      nitch
      autorandr
      xlayoutdisplay
      bottom
      jq
      rsync
      yt-dlp
      topgrade
      hello
      lazygit
      gdu
      tldr
      wlsunset
      quickemu
      #xss-lock
      #xautolock

      # Media
      smplayer
      celluloid
      imv
      tauon
      picard

      # Browsers
      brave
      vivaldi
      librewolf

      # Office, Reading and Notetaking
      libreoffice-fresh
      pdfarranger
      okular
      calibre
      obsidian
      logseq
      notion-app-enhanced
      foliate

      # File Managers
      pcmanfm
      lxmenu-data # Show list of installed apps when using PCManFM
      shared-mime-info # Recognize different file types in PCManFM


      #Apps
      bitwarden
      qbittorrent
      zoom-us
      mullvad-vpn
      tdesktop # Telegram Desktop
      thunderbird-bin
      obs-studio
      ArchiSteamFarm
      flameshot
      slack
      caffeine-ng

      # Design
      gimp
      inkscape
      #figma-linux

      # Visual
      lxappearance
      variety
      betterlockscreen
      font-manager


      ;

      # Gnome Packages
      inherit
        (pkgs.gnome)
        # gnome-tweaks
        gucharmap
        gnome-calendar
        ;

    #  inherit
    #     (pkgs.gnomeExtensions)
    #     supergfxctl-gex
    #     user-themes
    #     tiling-assistant
    #     awesome-tiles
    #     just-perfection
    #     forge
    #     kimpanel
    #     ;
  };
}
