{
  config,
  pkgs,
  inputs,
  ...
}: {

  # home = {
  #   activation.installNvimConfig = ''
  #   if [ ! -d "$HOME/.config/nvim" ]; then
  #   ln -s "/etc/nixos/home/will/modules/programs/nvim/nvim/lua/user" "$HOME/.config/nvim/lua"
  #   chmod -R +w "$HOME/.config/nvim"
  #   fi
  # '';
  # };

      xdg.configFile."nvim/lua/user".source = ./nvim/lua/user;


}