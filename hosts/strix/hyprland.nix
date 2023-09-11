{inputs, ...}: {
  imports = [inputs.hyprland.nixosModules.default];
  programs.hyprland = {
    enable = true;
    nvidiaPatches = true;
    xwayland = {
        enable = true;
      };
    };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };
}
