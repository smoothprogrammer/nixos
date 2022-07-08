{ config, pkgs, ... }:

{
  environment.systemPackages = [ pkgs.inkscape ];
}
