{ config, pkgs, ... }:

{
  environment.systemPackages = [ pkgs.firefox-wayland ];
}
