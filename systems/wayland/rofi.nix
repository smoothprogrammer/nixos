{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ rofi-wayland ];

  home-manager.sharedModules = [{
    xdg.configFile = {
      "rofi/config.rasi".source = ../config/rofi/config.rasi;
    };
  }];
}
