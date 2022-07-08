{ config, pkgs, ... }:

{
  imports = [
    ./greetd.nix # Login manager
    ./sway.nix # Window manager and Wayland compositor
    ./waybar.nix # Status bar
    ./rofi.nix # Launcher
  ];
}
