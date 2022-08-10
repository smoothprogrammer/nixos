{ config, pkgs, ... }:

{
  services.xserver.windowManager.bspwm.enable = true;

  home-manager.sharedModules = [{
    xdg.configFile = {
      "bspwm/bspwmrc".source = ../config/bspwm/bspwmrc;
    };

    xdg.dataFile = {
      "backgrounds/birds-eye-view-of-city.png".source = ../data/backgrounds/birds-eye-view-of-city.png;
    };
  }];
}
