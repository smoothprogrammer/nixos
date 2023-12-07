{ config, lib, pkgs, home-manager, ... }:

let
  cfg = config.conf.picom;
in
{
  options.conf.picom.enable = lib.mkEnableOption "picom";
  config = lib.mkIf cfg.enable {
    home-manager.sharedModules = [{
      services.picom = {
        enable = true;
        vSync = true;
        fade = true;
        shadow = true;
      };
    }];
  };
}
