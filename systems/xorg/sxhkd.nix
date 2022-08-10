{ config, pkgs, ... }:

{
  home-manager.sharedModules = [{
    xdg.configFile = {
      "sxhkd/sxhkdrc".source = ../config/sxhkd/sxhkdrc;
    };
  }];
}
