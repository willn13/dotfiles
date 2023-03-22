{
  inputs,
  pkgs,
  config,
  ...
}:

let

  inherit (inputs.nix-colors.lib-contrib {inherit pkgs;}) gtkThemeFromScheme;

in {

  gtk = {
    enable = true;
    theme = {
      name = "Kanagawa-BL";
      package = pkgs.callPackage ./kanagawa-gtk.nix {};
    };

    iconTheme = {
      name = "${
        if config.colorscheme.kind == "light"
        then "Papirus-Light"
        else "Papirus-Dark"
      }";
      package = pkgs.papirus-icon-theme;
    };

    font = {
      name = "Lato";
      package = pkgs.lato;
      size = 13;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
      gtk-decoration-layout = "menu:";
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
      gtk-decoration-layout = "menu:";
    };

  };

  # qt = {
  #   enable = true;
  #   platformTheme = "gtk";
  #   style = {
  #     name = "gtk2";
  #     #package = pkgs.adwaita-qt;
  #   };
  # };

  home = {
    pointerCursor = {
      name = "${
        if config.colorscheme.kind == "light"
        then "phinger-cursors-light"
        else "phinger-cursors"
      }";
      package = pkgs.phinger-cursors;
      size = 24;
      gtk.enable = true;
      x11.enable = true;
    };

    sessionVariables = {
      # Theming Related Variables
      #GTK_THEME = "${config.colorscheme.slug}";
      XCURSOR_SIZE = "${builtins.toString config.home.pointerCursor.size}";
    };
  };
}