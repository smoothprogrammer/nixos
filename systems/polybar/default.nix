{ config, pkgs, ... }:

{
	xdg.configFile = {
		"polybar/launch.sh" = {
			source = ./launch.sh;
		};
		"polybar/config.ini" = {
			source = ./config.ini;
			onChange = "$HOME/.config/polybar/launch.sh";
		};
	};

	home.packages = [ pkgs.polybar ];
}
