{ config, pkgs, ... }:

{
  services.xserver.enable = true;

  imports = [
    ./pipewire.nix # Audio and Video server
    ./sddm.nix # Display manager
    ./bspwm.nix # Window manager
    ./sxhkd.nix # Hotkey daemon
    ./picom.nix # Xorg compositor
    ./polybar.nix # Status bar
    ./rofi.nix # Launcher
  ];
}
