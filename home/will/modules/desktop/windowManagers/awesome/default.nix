{
  config,
  pkgs,
  inputs,
  ...
}: let
  inherit (config.colorscheme) colors;
in {
  xresources.extraConfig = ''
    Xft.dpi: 96
    Xft.antialias: true
    Xft.hinting: true
    Xft.rgba: rgb
    Xft.autohint: false
    Xft.hintstyle: hintfull
    Xft.lcdfilter: lcddefault

    *.cursorColor:  #${colors.base05}
    *background: #${colors.base00}
    *foreground: #${colors.base07}

    ! black
    *color0: #${colors.base00}
    *color8: #${colors.base03}

    ! red
    *color1: #${colors.base08D}
    *color9: #${colors.base08}

    ! green
    *color2: #${colors.base0BD}
    *color10: #${colors.base0B}

    ! yellow
    *color3: #${colors.base0AD}
    *color11: #${colors.base0A}

    ! blue
    *color4: #${colors.base0DD}
    *color12: #${colors.base0D}

    ! magenta
    *color5: #${colors.base0ED}
    *color13: #${colors.base0E}

    ! cyan
    *color6: #${colors.base0CD}
    *color14: #${colors.base0C}

    ! white
    *color7: #${colors.base06}
    *color15: #${colors.base07}
  '';

  home = {
    activation.installAwesomeWMConfig = ''
    if [ ! -d "$HOME/.config/awesome" ]; then
    ln -s "/etc/nixos/home/will/modules/desktop/windowManagers/awesome/awesome" "$HOME/.config/awesome"
    chmod -R +w "$HOME/.config/awesome"
    fi
    '';
  };


  imports = [
   ../../gtk.nix
    ../../picom.nix
    ../../rofi.nix
  ];
}
