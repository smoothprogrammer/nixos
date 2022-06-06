# Coinbit - ASUS X415
{ config, pkgs, ... }:

let
  version = "21.11";
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/refs/heads/release-${version}.tar.gz";
in
{
  imports =
    [
      ./hardware-configuration.nix
      (import "${home-manager}/nixos")
      ../../systems
      ../../users
    ];

  system.stateVersion = version;

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

  time.timeZone = "Asia/Jakarta";
  i18n.defaultLocale = "en_US.UTF-8";

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
