{ config, pkgs, ... }:

{
	environment.systemPackages = [ pkgs.brave ];
}
