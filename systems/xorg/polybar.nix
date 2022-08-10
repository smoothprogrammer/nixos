{ config, pkgs, ... }:

{
  environment.systemPackages = [ pkgs.polybarFull ];

  home-manager.sharedModules = [{
    xdg.configFile = {
      "polybar/launch.sh" = {
        source = ../config/polybar/launch.sh;
      };
      "polybar/config.ini" = {
        source = ../config/polybar/config.ini;
        onChange = "$HOME/.config/polybar/launch.sh";
      };
    };
  }];
}
