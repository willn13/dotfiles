{
  description = "Will's NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-master.url = "github:nixos/nixpkgs/master";
    nixpkgs-f2k.url = "github:fortuneteller2k/nixpkgs-f2k";
    nix-colors.url = "github:misterio77/nix-colors";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    neovim-nightly.url = "github:nix-community/neovim-nightly-overlay";
    nur.url = "github:nix-community/NUR";
    helix.url = "github:SoraTenshi/helix/experimental-22.12";
    devenv.url = "github:cachix/devenv";


    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nil = {
      url = "github:oxalica/nil";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.rust-overlay.follows = "rust-overlay";
    };
  

    # Non Flakes
    # awesome modules
    lain = {
      url = "github:lcpz/lain";
      flake = false;
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    devenv,
    ...
  } @ inputs: let
    inherit (self) outputs;
    forEachSystem = nixpkgs.lib.genAttrs ["x86_64-linux" "aarch64-linux"];
    forEachPkgs = f: forEachSystem (sys: f nixpkgs.legacyPackages.${sys});

  in {
    nixosModules = import ./modules/nixos;
    homeManagerModules = import ./modules/home-manager;
    overlays = import ./overlays {inherit inputs outputs;};
    packages = forEachPkgs (pkgs: import ./pkgs {inherit pkgs;});
    devShells = forEachPkgs (pkgs: import ./shell.nix {inherit pkgs;});

    nixosConfigurations = {
      # Laptop
      x510ur = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [./hosts/x510ur];
      };
      strix = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [./hosts/strix]; 
      };
    };

    homeConfigurations = {
      # Laptop
      "will@x510ur" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [./home/will];
      };
      "will@strix" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [./home/will];
      };
    };
  };
}
