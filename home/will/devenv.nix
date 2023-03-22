<<<<<<< HEAD
{ inputs, pkgs, ... }: {
  

  home.packages = with pkgs; [

  	cachix
    inputs.devenv.packages.x86_64-linux.devenv
    poetry
    direnv

  ];

}
||||||| parent of ae614a1 (Changes)
=======
{ inputs, pkgs, ... }: {
  

  home.packages = with pkgs; [

  	cachix
    inputs.devenv.packages.x86_64-linux.devenv
    poetry
    direnv
  ];

}
>>>>>>> ae614a1 (Changes)
