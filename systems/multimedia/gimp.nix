{ config, pkgs, ... }:

{
  environment.systemPackages = [ pkgs.gimp ];
}
