{
  lib,
  pkgs,
  config,
  inputs,
  outputs,
  ...
}:

{
  home = {
    username = "will";
    homeDirectory = "/home/${config.home.username}";
    stateVersion = "23.05";
  };

  # disable manuals as nmd fails to build often
  manual = {
    html.enable = false;
    json.enable = false;
    manpages.enable = false;
  };

  nix = {
    package = lib.mkForce pkgs.nixUnstable;
    settings = {
      experimental-features = ["nix-command" "flakes" "repl-flake"];
      warn-dirty = false;
    };
  };

  nixpkgs = {
    overlays = [
      outputs.overlays.default
      inputs.nixpkgs-f2k.overlays.stdenvs
      inputs.nur.overlay
    ];

    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
      permittedInsecurePackages = [
        # Until Sublime Text changes Openssl version
        "openssl-1.1.1w"
        "electron-24.8.6"
      ];
    };
  };

  # let HM manage itself when in standalone mode
  programs.home-manager.enable = true;


}
