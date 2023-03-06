{
  inputs,
  config,
  ...
}: let
  inherit (inputs.nix-colors) colorSchemes;
  # Custom colorscheme list
  kanagawa = (import ./kanagawa.nix).colorscheme;
in {
  imports = [
    inputs.nix-colors.homeManagerModule
  ];

  # Use the custom color scheme
  colorscheme = kanagawa;

  # Use the colorscheme available at github:tinted-theming/base16-schemes
  # colorscheme = colorSchemes.ashes;
}
