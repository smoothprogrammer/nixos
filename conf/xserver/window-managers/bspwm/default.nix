{ config, lib, pkgs, home-manager, ... }:

let
  cfg = config.conf.xserver.windowManager.bspwm;
in {
  options.conf.xserver.windowManager.bspwm.enable = lib.mkEnableOption "bspwm";
  config = lib.mkIf cfg.enable {
    services.xserver.windowManager.bspwm.enable = true;
    home-manager.sharedModules = [{
	  xdg.configFile."bspwm/bspwmrc".source = ./bspwmrc;
	  xdg.configFile."sxhkd/sxhkdrc".source = ./sxhkdrc;
    }];
  };
}
