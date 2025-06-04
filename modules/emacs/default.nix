{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.conf.emacs;
in
{
  options.conf.emacs.enable = lib.mkEnableOption "emacs";
  config = lib.mkIf cfg.enable {
    services.emacs = {
      enable = true;
      package = pkgs.emacs.pkgs.withPackages (
        epkgs: with epkgs; [
          solarized-theme
        ]
      );
    };
  };
}
