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
      zellij
      ueberzug
      tk
      yad

      # Editors
      neovim
      neovide
      beekeeper-studio

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
      #xss-lock
      #xautolock

      # Media
      smplayer
      celluloid
      imv
      tauon
      picard

      # Browsers
      vivaldi
      brave
      librewolf

      # Office
      zathura
      libreoffice-fresh
      pdfarranger
      okular

      #Apps
      bitwarden
      qbittorrent
      zoom-us
      mullvad-vpn
      pcmanfm
      tdesktop # Telegram Desktop
      thunderbird-bin
      obs-studio
      gimp
      slack
      lf
      ArchiSteamFarm
      notion-app-enhanced
      obsidian
      figma-linux
      inkscape
      flameshot
      logseq

      # Visual
      lxappearance
      variety
      betterlockscreen
     

      ;

      inherit
        (pkgs.gnome)
        gnome-tweaks
        ;

     inherit
        (pkgs.gnomeExtensions)
        supergfxctl-gex
        user-themes
        tiling-assistant
        awesome-tiles
        just-perfection
        forge
        kimpanel
        ;
  };
}
