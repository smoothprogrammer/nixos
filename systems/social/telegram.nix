{ config, pkgs, ... }:

{
	environment.systemPackages = [ pkgs.tdesktop ];
}
