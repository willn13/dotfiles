  {
  config,
  pkgs,
  inputs,
  ...
}: {

  home = {
    activation.installNvimConfig = ''
    if [ ! -d "$HOME/.config/nvim" ]; then
    ln -s "etc/nixos/home/will/modules/programs/nvim/nvim" "$HOME/.config/nvim"
    chmod -R +w "$HOME/.config/nvim"
    fi
  '';
  };

}