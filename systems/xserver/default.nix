{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    desktopManager.xterm.enable = false;
    displayManager.defaultSession = "none+bspwm";
    windowManager.bspwm = {
      enable = true;
      configFile = ./bspwmrc;
      sxhkd.configFile = ./sxhkdrc;
    };
  };
}
