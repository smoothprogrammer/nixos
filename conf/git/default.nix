{ config, lib, pkgs, ... }:

let
  cfg = config.conf.git;
in
{
  options.conf.git.enable = lib.mkEnableOption "git";
  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ pkgs.git ];
    home-manager.sharedModules = [{
      xdg.configFile."git/config".source = ./config;
      xdg.configFile."git/ignore".source = ./ignore;
      xdg.configFile."git/personal".source = ./personal;
      xdg.configFile."git/work".source = ./work;
    }];
  };
}
