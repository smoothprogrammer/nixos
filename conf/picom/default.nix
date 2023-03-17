{ config, lib, pkgs, ... }:

let
  cfg = config.conf.picom;
in {
  options.conf.picom.enable = lib.mkEnableOption "picom";
  config = lib.mkIf cfg.enable {
    services.picom = {
      enable = true;
      shadow = true;
      fade = true;
    };
  };
}
