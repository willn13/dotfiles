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
      bottom
      jq
      rsync
      yt-dlp
      topgrade
      hello
      #xss-lock
      #xautolock

      # Media
      smplayer
      imv

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
  };
}
