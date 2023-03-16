{
  lib,
  stdenv,
  fetchFromGitHub,
}:
stdenv.mkDerivation rec {
  pname = "firefox-csshacks";
  version = "master";

  src = fetchFromGitHub {
    repo = pname;
    owner = "MrOtherGuy";
    rev = "${version}";
    sha256 = "sha256-DknRio6KS2Bl5oOHfuFxQimKeybT8Uur7V3abnyMCJE=";
  };

  dontConfigure = true;
  dontBuild = true;
  doCheck = false;

  installPhase = ''
    mkdir -p $out/share/firefox-csshacks
    cp -r $src/* $out/share/firefox-csshacks
  '';

  meta = with lib; {
    description = "Custom css for firefox";
    homepage = "https://github.com/MrOtherGuy/firefox-csshacks";
    license = licenses.unlicense;
  };
}
