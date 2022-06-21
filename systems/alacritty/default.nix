{ config, pkgs, ... }:

{
	xdg.configFile = {
		"alacritty/alacritty.yml".source = ./alacritty.yml;
		"alacritty/dracula.yml".source = ./dracula.yml;
	};

	home.packages = [ pkgs.alacritty ];
}
