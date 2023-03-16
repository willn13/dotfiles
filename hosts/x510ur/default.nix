{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  disabledModules = [
    # Disable the default Awesome WM module
    "services/x11/window-managers/awesome.nix"
  ];

  imports = [
    # Shared configuration across all machines
    ../shared

    # Select the user configuration
    ../shared/users/will.nix

    # Fix Flatpak fonts not displaying correctly
    ./flatpak-fonts.nix

    # Steam
    ./gaming.nix


    # Specific configuration
    ./hardware-configuration.nix

  ];

  boot = {
    initrd = {
      supportedFilesystems = ["btrfs"];
      systemd.enable = true;
    };

    kernelModules = ["acpi_call"];
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
    blacklistedKernelModules = [ "nouveau" ];
    extraModulePackages = with config.boot.kernelPackages; [acpi_call];
    kernelParams = [
      # "i8042.direct"
      # "i8042.dumbkbd"
      # "i915.force_probe=46a6"
      # "button.lid_init_state=open"
    ];

    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };

      grub = {
        enable = true;
        version = 2;
        device = "nodev";
        efiSupport = true;
        useOSProber = true;
        enableCryptodisk = true;
        configurationLimit = 3;
        gfxmodeEfi = "1920x1080";
        theme = pkgs.fetchzip {
          url = "https://raw.githubusercontent.com/AdisonCavani/distro-grub-themes/master/themes/asus.tar";
          hash = "sha256-8YjpOa8a49BANzrQSgb3Qsm6jHTqZfDSxvbsaDzy8VA=";
          stripRoot = false;
        };
      };
    };
  };

  hardware = {
    enableRedistributableFirmware = true;
    bluetooth = {
      enable = true;
      package = pkgs.bluezFull;
    };

    nvidia = {
      open = false;
      modesetting.enable = true;

      powerManagement = {
        enable = true;
        finegrained = true;
      };

      prime = {
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";

        offload = {
          enable = true;
          enableOffloadCmd = true;
        };

        reverseSync.enable = true;
      };


      nvidiaSettings = true;

    };

    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [
        intel-media-driver
        libvdpau-va-gl
        vaapiIntel
        vaapiVdpau
        nvidia-vaapi-driver
      ];
    };
  };

  location.provider = "geoclue2";

  networking = {
    hostName = "x510ur";
    networkmanager.enable = true;
    useDHCP = false;
  };

  services = {
    acpid = {
    enable = true;
    # Suspend when closing laptop lid
    lidEventCommands = ''
      systemctl suspend
    '';
  };

  # btrfs.autoScrub.enable = true;

    xserver = {
      enable = true;
      layout = "us";
      xkbVariant = "alt-intl";
      videoDrivers = ["nvidia"];
      displayManager = {
        autoLogin = {
          enable = false;
          user = "will";
        };
      lightdm.enable = true;
      };
      desktopManager.xfce.enable = true;
    };

    upower.enable = true;

    logind = {

     # Another way to suspend when lid close. Doesn´t work for me for some reason
     # lidSwitch = "suspend"; 

     # Power key will suspend instead of shutdown
      extraConfig = '' 
      HandlePowerKey = suspend 
      '';
    };

    # Enable Flatpak support
    flatpak.enable = true;

  };


  environment = {
    systemPackages = lib.attrValues {
      inherit
        (pkgs)
        acpi
        libva
        libvdpau
        libva-utils
        vulkan-loader
        vulkan-validation-layers
        vulkan-tools
        ;

      inherit
        (pkgs.libsForQt5)
        qtstyleplugins
        ;
    };

    variables = {
      # GDK_SCALE = "2";
      # GDK_DPI_SCALE = "0.5";
#      QT_QPA_PLATFORMTHEME = "gtk2";
      CM_LAUNCHER = "rofi";
    };
  };

  services.xserver.windowManager.awesome.enable = true;

  fileSystems."/run/media/will/Secondary" =
  { device = "/dev/disk/by-label/Secondary";
    fsType = "auto";
    options = [ "nosuid" "nodev" "nofail" "x-gvfs-show"];
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";

  # Also needed for Flatpak support
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
}
