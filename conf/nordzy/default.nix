{ config, lib, pkgs, home-manager, ... }:

let
  cfg = config.conf.nordzy;
in
{
  options.conf.nordzy.enable = lib.mkEnableOption "nordzy";
  config = lib.mkIf cfg.enable {
    home-manager.sharedModules = [{
      home.pointerCursor = {
        name = "Nordzy-cursors";
        package = pkgs.nordzy-cursor-theme;
        size = 48;
        gtk.enable = true;
        x11.enable = true;
      };
    }];
  };
}
