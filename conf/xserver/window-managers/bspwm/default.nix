{ config, lib, pkgs, home-manager, ... }:

let
  cfg = config.conf.xserver.windowManager.bspwm;
in
{
  options.conf.xserver.windowManager.bspwm.enable = lib.mkEnableOption "bspwm";
  config = lib.mkIf cfg.enable {
    hardware.opengl.enable = true;
    services.xserver.windowManager.bspwm.enable = true;
    environment.systemPackages = with pkgs; [
      xclip
    ];

    home-manager.sharedModules = [{
      xdg.configFile."bspwm/bspwmrc".source = ./bspwmrc;
      xdg.configFile."sxhkd/sxhkdrc".source = ./sxhkdrc;
    }];
  };
}
