{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ rofi ];

  home-manager.sharedModules = [{
    xdg.configFile = {
      "rofi/config.rasi".source = ../config/rofi/config.rasi;
    };
  }];
}
