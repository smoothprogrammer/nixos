{ config, pkgs, ... }:

{
  home.packages = [ pkgs.polybar ];
  xdg.configFile = {
    "polybar/config.ini" = {
      source = ./config.ini;
      onChange = "$HOME/.config/polybar/launch.sh";
    };
    "polybar/launch.sh" = {
      source = ./launch.sh;
    };
  };
}
