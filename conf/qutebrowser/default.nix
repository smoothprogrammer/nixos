{ config, lib, pkgs, ... }:

let
  cfg = config.conf.qutebrowser;
in {
  options.conf.qutebrowser.enable = lib.mkEnableOption "qutebrowser";
  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ pkgs.qutebrowser ];
    environment.variables = {
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    };
  };
}
