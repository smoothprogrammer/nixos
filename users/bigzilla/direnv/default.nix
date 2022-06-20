{ config, pkgs, ... }:

{
	xdg.configFile = {
		"direnv/direnv.toml" = ./direnv.toml;
	};

	home.packages = [ pkgs.direnv ];
}
