{ config, lib, pkgs, home-manager, ... }:

let
  cfg = config.conf.rofi;
in
{
  options.conf.rofi.enable = lib.mkEnableOption "rofi";
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ rofi ];
    home-manager.sharedModules = [{
      xdg.configFile."rofi/config.rasi".source = ./config.rasi;
    }];
  };
}
