{ config, pkgs, ... }:

{
	xdg.configFile = {
		"rofi/config.rasi".source = ./config.rasi;
	};

	home.packages = [ pkgs.rofi ];
}
