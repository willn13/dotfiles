{
  lib,
  pkgs,
  ...
}: {
  programs = {
    adb.enable = true;
    bash.promptInit = ''eval "$(${lib.getExe pkgs.starship} init bash)"'';
    dconf.enable = true;

    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        curl
        glib
        glibc
        icu
        libunwind
        libuuid
        libsecret
        openssl
        stdenv.cc.cc
        util-linux
        zlib
      ];
    };

    java = {
      enable = true;
      package = pkgs.jre;
    };

    nm-applet.enable = true;
    seahorse.enable = true;
    ssh.startAgent = true;
  };
}
