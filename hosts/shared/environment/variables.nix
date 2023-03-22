{ config, lib, ...}:

{
  environment.variables = {
    EDITOR = "nvim";
    BROWSER = "firefox";
    QT_QPA_PLATFORMTHEME = lib.mkForce "gtk2";
    QT_STYLE_OVERRIDE= lib.mkForce "gtk2";
  };
}
