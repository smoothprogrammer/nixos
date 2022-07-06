{ config, pkgs, ... }:

{
	environment.systemPackages = [ pkgs.libreoffice ];
}
