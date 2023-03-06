{pkgs ? import <nixpkgs> {}}: {
  macos-cursors = pkgs.callPackage ./macos-cursors {};
  material-symbols = pkgs.callPackage ./material-symbols {};
  firefox-csshacks = pkgs.callPackage ./firefox-csshacks {};
}
