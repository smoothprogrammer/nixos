{ config, pkgs, ... }:

{
  imports = [
    ./fonts.nix # Fonts
    ./pipewire.nix # Audio and Video
    ./light.nix # Backlight
  ];

  environment.systemPackages = with pkgs; [
    editorconfig-checker # Check editorconfig compliance
    neofetch # Fetch system information
    nixos-option # Inspect NixOS configuration
    wget # Network downloader
    ytmdl # Youtube music downloader
  ];
}
