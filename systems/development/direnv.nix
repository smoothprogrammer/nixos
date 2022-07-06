{ config, pkgs, ... }:

{
	environment.systemPackages = [ pkgs.direnv ];

	home-manager.sharedModules = [{
		xdg.configFile = {
			"direnv/direnv.toml".source = ../config/direnv/direnv.toml;
		};
	}];
}
