{
  lib,
  pkgs,
  ...
}: {
  home.packages = lib.attrValues {
    inherit
      (pkgs)

      # Python
      black

      # Nodejs
      nodejs

      # Lua
      selene
      sumneko-lua-language-server
      stylua

      # Shell
      shfmt
      shellcheck

      # SQL
      sqlite
      postgresql
      mariadb

      # Rust
      cargo

      # Others
      R
      texlab

      ;

    inherit
      (pkgs.luaPackages)
      lua
      ;

    pylsp = pkgs.python310.withPackages (p:
      with p; [
        python-lsp-server
        flake8
      ]);
  };
}