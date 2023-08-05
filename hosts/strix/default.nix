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

    # Gaming
    ./gaming.nix

    # Hyprland Support
    ./hyprland.nix

    # Specific configuration
    ./hardware-configuration.nix
  ];

  boot = {
    initrd = {
      supportedFilesystems = ["btrfs"];
      systemd.enable = true;
    };

    kernelModules = ["amd-pstate" "acpi_call"];
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
    blacklistedKernelModules = ["nouveau"];
    extraModulePackages = with config.boot.kernelPackages; [acpi_call];
    kernelParams = [
      "initcall_blacklist=acpi_cpufreq_init"
      "amd_pstate=passive"
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
        device = "nodev";
        efiSupport = true;
        useOSProber = true;
        enableCryptodisk = true;
        configurationLimit = 3;
        gfxmodeEfi = "1920x1080";
        theme = pkgs.fetchzip {
          url = "https://raw.githubusercontent.com/AdisonCavani/distro-grub-themes/master/themes/asus.tar";
          hash = "sha256-bYAlohcC9wn7brINiM3+uSi667TlM8aGNxbekITfCQo=";
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

    cpu = {
      amd.updateMicrocode = true;
    };

    nvidia = {
      open = false;
      modesetting.enable = true;

      powerManagement = {
        enable = true;
        finegrained = true;
      };

      prime = {
        amdgpuBusId = "PCI:6:0:0";
        nvidiaBusId = "PCI:1:0:0";

        offload = {
          enable = true;
          enableOffloadCmd = true;
        };

        reverseSync.enable = true;
      };
    };

    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [
        libvdpau-va-gl
        vaapiVdpau
        nvidia-vaapi-driver
      ];
    };
  };

  location.provider = "geoclue2";

  networking = {
    hostName = "strix";
    networkmanager.enable = true;
    useDHCP = false;
  };

  services = {
    asusd.enable = true;
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
        setupCommands = "${pkgs.xorg.xrandr}/bin/xrandr --output eDP-1 --mode 2560x1440 --pos 1920x0 --rotate normal --output DisplayPort-1 --off --output DisplayPort-2 --off --output DisplayPort-3 --off --output DisplayPort-4 --off --output DisplayPort-5 --off --output DP-1-0 --primary --mode 1920x1080 --rate 120 --pos 0x0 --rotate normal --output DP-1-1 --off --output DP-1-2 --off --output HDMI-1-0 --off";
        autoLogin = {
          enable = false;
          user = "will";
        };
        sddm = {
          enable = true;
          autoNumlock = true;
        };
      };

      desktopManager.gnome.enable = true;
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

    switcherooControl.enable = true;
  };

  environment = {
    systemPackages = lib.attrValues {
      inherit
        (pkgs)
        acpi
        asusctl
        ffmpeg
        libGL
        libGLU
        libva
        libvdpau
        libva-utils
        samba
        supergfxctl
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
      CM_LAUNCHER = "rofi";
    };
  };

  services.xserver.windowManager.awesome.enable = true;

  # Auto mount NTFS drive
  fileSystems."/run/media/will/Secondary" = {
    device = "/dev/disk/by-label/Secondary";
    fsType = "ntfs-3g";
    options = ["uid=1000" "gid=1000" "nosuid" "nodev" "nofail" "x-gvfs-show"];
  };

  #   # Auto mount BTRFS drive
  #   fileSystems."/run/media/will/Secondary" =
  # { device = "/dev/disk/by-label/Secondary";
  #   fsType = "btrfs";
  #   options = [ "nosuid" "nodev" "nofail" "x-gvfs-show" ];
  # };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";

  # Also needed for Flatpak support
  xdg.portal.enable = true;
  #sxdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
}
