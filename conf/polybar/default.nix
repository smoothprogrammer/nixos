{ config, lib, pkgs, home-manager, ... }:

let
  cfg = config.conf.polybar;
in
{
  options.conf.polybar.enable = lib.mkEnableOption "polybar";
  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ pkgs.polybarFull ];
    home-manager.sharedModules = [{
      xdg.configFile."polybar/launch.sh".source = ./launch.sh;
      xdg.configFile."polybar/config.ini".source = ./config.ini;
    }];
  };
}
