{ config, lib, pkgs, home-manager, ... }:

let
  cfg = config.conf.direnv;
in {
  options.conf.direnv.enable = lib.mkEnableOption "direnv";
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ direnv nix-direnv ];
    environment.pathsToLink = [ "/share/nix-direnv" ];
    home-manager.sharedModules = [{
      xdg.configFile."direnv/direnv.toml".source = ./direnv.toml;
      xdg.configFile."direnv/direnvrc".source = ./direnvrc;
    }];
  };
}
