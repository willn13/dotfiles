{
  networking = {
    iproute2.enable = true;
    networkmanager = {
      enable = true;
      unmanaged = ["docker0" "rndis0"];
      wifi.macAddress = "random";
    };

    firewall = {
      enable = true;
      checkReversePath = "loose";
      allowPing = false;
      logReversePathDrops = true;
    };

    wireguard = {
      enable = true;
      interfaces.wg0 = {
      generatePrivateKeyFile = true;
      privateKeyFile = "/persist/etc/wireguard/wg0";
  };
};

  };

  services.mullvad-vpn.enable = true;

  # slows down boot time
  systemd.services.NetworkManager-wait-online.enable = false;
}
