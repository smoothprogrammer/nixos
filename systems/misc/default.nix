{ config, pkgs, ... }:

{
  imports = [
    ./networking.nix # Network
    ./fonts.nix # Fonts
    ./light.nix # Backlight
  ];

  environment.systemPackages = with pkgs; [
    neofetch # Fetch system information
    nixos-option # Inspect NixOS configuration
    wget # Network downloader
    ytmdl # Youtube music downloader
  ];
}
