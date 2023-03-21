{ config, lib, pkgs, home-manager, user, ... }:

let
  cfg = config.conf.firefox;
in {
  options.conf.firefox.enable = lib.mkEnableOption "firefox";
  config = lib.mkIf cfg.enable {
    home-manager.sharedModules = [{
      programs.firefox = {
        enable = true;
        profiles.${user} = {
          id = 0;
          isDefault = true;
          extraConfig = builtins.readFile ./user.js + builtins.readFile ./user-overrides.js;
        };
      };
    }];
  };
}
