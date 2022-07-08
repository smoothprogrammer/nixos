{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ foot ];

  home-manager.sharedModules = [{
    xdg.configFile = {
      "foot/foot.ini".source = ../config/foot/foot.ini;
    };
  }];
}
