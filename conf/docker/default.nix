{ config, lib, pkgs, user, ... }:

let
  cfg = config.conf.docker;
in {
  options.conf.docker.enable = lib.mkEnableOption "docker";
  config = lib.mkIf cfg.enable {
    virtualisation.docker.enable = true;
    users.extraGroups.docker.members = [ user ];
  };
}
