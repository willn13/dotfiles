{ pkgs, ... }: {

  services = {
     gammastep = {
       enable = true;
       temperature.night = 3000;
       latitude = 35.6895;
       longitude = 139.69171;
   	};
  };
}