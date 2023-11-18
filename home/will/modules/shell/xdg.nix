{
  lib,
  config,
  pkgs,
  ...
}:
with lib; let
  browser = ["firefox.desktop"];
  associations = {
    "application/x-extension-htm" = browser;
    "application/x-extension-html" = browser;
    "application/x-extension-shtml" = browser;
    "application/x-extension-xht" = browser;
    "application/x-extension-xhtml" = browser;
    "application/xhtml+xml" = browser;
    "text/html" = browser;
    "x-scheme-handler/about" = browser;
    "x-scheme-handler/chrome" = ["brave-browser.desktop"];
    "x-scheme-handler/ftp" = browser;
    "x-scheme-handler/http" = browser;
    "x-scheme-handler/https" = browser;
    "x-scheme-handler/unknown" = browser;


    "audio/*" = ["tauonmb.desktop"];
    "audio/mp3" = ["tauonmb.desktop"];
    "video/mp4" = ["io.github.celluloid_player.Celluloid.desktop"];
    "image/*" = ["imv.desktop"];
    "image/jpeg" = ["imv.desktop"];
    "image/png" = ["imv.desktop"];
    "application/json" = browser;
    "application/pdf" = ["org.pwmt.zathura.desktop"];
    "application/zip" = ["xarchiver.desktop"];
    "application/rar" = ["xarchiver.desktop"];
    "application/epub+zip" = ["io.github.troyeguo.koodo-reader.desktop"];
    "application/x-7z-compressed" = ["xarchiver.desktop"];
    "x-scheme-handler/discord" = ["discordcanary.desktop"];
    "x-scheme-handler/spotify" = ["spotify.desktop"];
    "x-scheme-handler/tg" = ["org.telegram.desktop.desktop"];
  };
in {
  home.packages = with pkgs; [xdg-utils];

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
      extraConfig = {
        XDG_DEVELOPMENT_DIR = "${config.xdg.userDirs.documents}/Dev";
      };
    };

      
    mimeApps = {
      enable = true;
      associations.added = associations;
      defaultApplications = associations;
    };
  };
}
