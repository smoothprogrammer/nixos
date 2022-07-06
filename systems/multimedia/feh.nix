{ config, pkgs, ... }:

{
	environment.systemPackages = [ pkgs.feh ];

	home-manager.sharedModules = [{
		xdg.configFile = {
			"feh/wallpaper.jpg".source = ../config/feh/wallpaper.jpg;
		};
	}];
}
