{ config, lib, pkgs, home-manager, ... }:

let
  cfg = config.conf.xserver;
in
{
  imports = [
    ./display-managers
    ./window-managers
  ];
  options.conf.xserver = {
    enable = lib.mkEnableOption "the X server";
    autoLoginUser = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = "User to be used for the automatic login.";
    };
  };
  config = lib.mkIf cfg.enable {
    services.xserver = lib.mkMerge [
      {
        enable = true;
        excludePackages = with pkgs; [ xterm ];
        desktopManager.xterm.enable = false;
        desktopManager.wallpaper.mode = "fill";
      }
      (lib.mkIf (cfg.autoLoginUser != null) {
        displayManager.autoLogin.user = cfg.autoLoginUser;
      })
    ];

    home-manager.sharedModules = [{
      xresources.properties = {
        "Xft.dpi" = 192;
        "Xft.autohint" = 0;
        "Xft.antialias" = 1;
        "Xft.hinting" = 1;
        "Xft.hintstyle" = "hintslight";
        "Xft.lcdfilter" = "lcddefault";
        "Xft.rgba" = "rgb";
      };
    }];
  };
}
