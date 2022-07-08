{ config, pkgs, ... }:

{
  environment.systemPackages = [ pkgs.cmus ];
}
