{
  pkgs,
  lib,
  ...
}: {
  fonts = {
    packages = lib.attrValues {
      inherit
        (pkgs)
        maple-mono
        maple-mono-NF
        maple-mono-SC-NF
        material-symbols
        lato
        noto-fonts-emoji
        noto-fonts
        noto-fonts-cjk
        ;
      nerdfonts = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
    };

    fontconfig = {
      enable = true;
      antialias = true;
      hinting = {
        enable = true;
        autohint = true;
        style = "full";
      };

      subpixel.lcdfilter = "default";

      defaultFonts = {
        emoji = ["Noto Color Emoji"];
        monospace = ["Maple Mono NF"];
        sansSerif = ["Noto Sans" "Noto Color Emoji"];
        serif = ["Noto Serif" "Noto Color Emoji"];
      };
    };
  };
}
