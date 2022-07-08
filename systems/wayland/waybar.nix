{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ waybar ];

  home-manager.sharedModules = [{
    xdg.configFile = {
      "waybar/config".source = ../config/waybar/config;
      "waybar/style.css".source = ../config/waybar/style.css;
    };
  }];
}
