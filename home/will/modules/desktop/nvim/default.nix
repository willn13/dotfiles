  {
  config,
  pkgs,
  inputs,
  ...
}: {

  home = {
    activation.installNvimConfig = ''
    if [ ! -d "$HOME/.config/nvim" ]; then
    ln -s "/home/will/.setup/home/will/modules/desktop/nvim/nvim" "$HOME/.config/nvim"
    chmod -R +w "$HOME/.config/nvim"
    fi
  '';
  };

}