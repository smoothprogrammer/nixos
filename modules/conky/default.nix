{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.conf.conky;
in
{
  options.conf.conky.enable = lib.mkEnableOption "conky";
  config = lib.mkIf cfg.enable {
    home-manager.sharedModules = [
      {
        xsession.initExtra = ''
          ${pkgs.conky}/bin/conky
        '';
      }
    ];
  };
}
