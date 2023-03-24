{ config, lib, pkgs, ... }:

let
  cfg = config.conf.kitty;
in
{
  options.conf.kitty.enable = lib.mkEnableOption "kitty";
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ kitty ];
    home-manager.sharedModules = [{
      xdg.configFile."kitty/kitty.conf".source = ./kitty.conf;
    }];
  };
}
