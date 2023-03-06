{ config, pkgs, ... }:

let 

  vimium = "dbepggeogbaibhgnhhndojpepiihcmeb";
  enhancer_for_youtube = "ponfpcnoihfmfllpaingbgckeeldkhle";
  ublock_origin = "cjpalhdlnbpafiamejdnhcphjbkeiagm";
  yomichan = "ogmnaimimemjmbakcfefmnahgdfhfami";
  deepl = "cofdbpoegempjloogbagkncekinflcnj";
  bitwarden = "nngceckbapebfimnlniiiahkandclblb";
  enhanced_github = "anlikcnbgdeidpacdbdljnabclhahhmd";
  octotree = "bkhaagjahfmjljalopjnoealnfndnagc";
  refined_github = "hlepfoohegkhhmjieoechaddaejaokhf";



in {
  programs.chromium = {
    enable = true;


    extensions = [
      { id = vimium; }
      { id = enhancer_for_youtube; }
      { id = ublock_origin; }
      { id = yomichan; }
      { id = deepl; }
      { id = bitwarden; }
      { id = enhanced_github; }
      { id = octotree; }
      { id = refined_github; }





    ];

    package = pkgs.brave;
  };
}