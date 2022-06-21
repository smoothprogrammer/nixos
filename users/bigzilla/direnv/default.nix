{ config, pkgs, ... }:

{
	xdg.configFile = {
		"direnv/direnv.toml".source = ./direnv.toml;
	};

	home.packages = [ pkgs.direnv ];
}
