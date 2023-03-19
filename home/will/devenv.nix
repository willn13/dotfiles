{ inputs, pkgs, ... }: {
  

  home.packages = with pkgs; [

  	cachix
    inputs.devenv.packages.x86_64-linux.devenv
    poetry
    direnv

  ];

}
