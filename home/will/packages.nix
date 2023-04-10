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
      wkhtmltopdf-bin
      ueberzug
      tk


      # Editors
      neovim
      sublime4
      neovide

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
      blender


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
        ;
  };
}
