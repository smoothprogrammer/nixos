{ config, lib, pkgs, home-manager, ... }:

let
  cfg = config.conf.alacritty;
in
{
  options.conf.alacritty.enable = lib.mkEnableOption "alacritty";
  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ pkgs.alacritty ];
    home-manager.sharedModules = [{
      xdg.configFile."alacritty/alacritty.yml".source = ./alacritty.yml;
    }];
  };
}
