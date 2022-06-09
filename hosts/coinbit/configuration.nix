# Coinbit - ASUS X415
{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../systems
    ../../users
  ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  boot.initrd.luks.devices = {
    nixos = {
      device = "dev/disk/by-uuid/fef539c8-7bca-4ee5-a278-f108b0901124";
      preLVM = true;
      allowDiscards = true;
    };
  };

  networking = {
    hostName = "coinbit";
    networkmanager.enable = true;

    # The global useDHCP flag is deprecated, therefore explicitly set to false here.
    # Per-interface useDHCP will be mandatory in the future, so this generated config
    # replicates the default behaviour.
    useDHCP = false;
    interfaces.wlo1.useDHCP = true;
  };

  services.xserver = {
    enable = true;

    # GNOME
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;

    # Keyboard
    layout = "us";

    # Touchpad
    libinput.enable = true;
  };  

  sound = {
    enable = true;
    mediaKeys.enable = true;
  };

  hardware = {
    pulseaudio.enable = true;
    bluetooth = {
      enable = true;
      powerOnBoot = false;
    };
  };
}
