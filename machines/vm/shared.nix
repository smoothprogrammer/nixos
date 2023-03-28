{ config, lib, pkgs, user, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # No fancy networking setup on VM.
  networking.hostName = "dev";
  networking.useDHCP = false;

  # Extra /etc/hosts
  networking.hostFiles = [
    ../../etc/hosts/reddit
  ];

  # Halo Dunia!
  time.timeZone = "Asia/Jakarta";

  # Run VM on HiDPI machines.
  hardware.video.hidpi.enable = true;

  # Nix settings.
  nix.extraOptions = ''
    experimental-features = nix-command flakes
    warn-dirty = false
    keep-outputs = true
    keep-derivations = true
    trusted-users = @wheel
  '';

  # GC.
  nix.gc = {
    automatic = true;
    options = "--delete-older-than 30d";
  };

  # Nixpkgs settings.
  nixpkgs.config.allowUnfree = true;

  # SSH and GPG.
  programs.ssh.startAgent = true;
  programs.gnupg.agent.enable = true;

  # Dconf.
  programs.dconf.enable = true;

  # System packages.
  environment.systemPackages = with pkgs; [
    bat
    htop
    killall
    neofetch
  ];

  # Enable configured set of pkgs.
  conf = {
    alacritty.enable = true;
    backgrounds.enable = true;
    conky.enable = true;
    direnv.enable = true;
    docker.enable = true;
    firefox.enable = true;
    fish.enable = true;
    fonts.enable = true;
    git.enable = true;
    kitty.enable = true;
    nordzy.enable = true;
    nvim.enable = true;
    picom.enable = true;
    rofi.enable = true;
    syncthing = {
      enable = true;
      inherit user;
    };
    systemd-boot = {
      enable = true;
      silent = true;
    };
    xserver = {
      enable = true;
      autoLoginUser = user;
      windowManager.bspwm.enable = true;
    };
  };
}
