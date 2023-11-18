{pkgs, ...}: {
  # TODO vscode & chrome both have wayland support, but they don't work with fcitx5, need to fix it.
  programs = {

    firefox = {
      enable = true;
      enableGnomeExtensions = false;
      package = pkgs.firefox-wayland; # firefox with wayland support
    };
  };
  
}
