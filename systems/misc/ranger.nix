{ config, pkgs, ... }:

{
	environment.systemPackages = [ pkgs.ranger ];
}
