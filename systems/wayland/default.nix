{ config, pkgs, ... }:

{
  imports = [
    ./xdg.nix # XDG Desktop Integration
    ./pipewire.nix # Audio and Video
    ./greetd.nix # Login manager
    ./sway.nix # Window manager and Wayland compositor
    ./waybar.nix # Status bar
    ./rofi.nix # Launcher
  ];
}
