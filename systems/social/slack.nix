{ config, pkgs, ... }:

{
  environment.systemPackages = [ pkgs.slack ];
}
