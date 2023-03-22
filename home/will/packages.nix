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
<<<<<<< HEAD
      
||||||| parent of ae614a1 (Changes)
      pistol
      
=======

>>>>>>> ae614a1 (Changes)

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
      imv
      tauon
      picard

      # Browsers
      vivaldi
      brave
      librewolf

      # Office
      zathura
      libreoffice-still
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


      # Visual
      lxappearance
      variety
      betterlockscreen
      ;

     inherit
      (pkgs.gnomeExtensions)
      supergfxctl-gex
      ;
  };
}
