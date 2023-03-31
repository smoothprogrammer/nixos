{ config, lib, pkgs, home-manager, ... }:

let
  cfg = config.conf.rofi-pass;
in
{
  options.conf.rofi-pass.enable = lib.mkEnableOption "rofi-pass";
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ rofi-pass pass ];
    home-manager.sharedModules = [{
      xdg.configFile."rofi-pass/config".source = ./config;
    }];
  };
}
