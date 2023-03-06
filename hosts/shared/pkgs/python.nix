{pkgs, ...}:
with pkgs;
  [
    (python3.withPackages (p:
      with p; [
        pip
        pynvim
        pandas
        jupyter
        matplotlib
        plotly
      ]))
  ]
  ++ [
    gobject-introspection
    pipenv
  ]