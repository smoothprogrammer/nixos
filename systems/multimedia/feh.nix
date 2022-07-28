{ config, pkgs, ... }:

{
  environment.systemPackages = [ pkgs.feh ];
}
