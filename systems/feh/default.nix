{ config, pkgs, ... }:

{
	xdg.configFile = {
		"feh/wallpaper.jpg" = {
			source = ./wallpaper.jpg;
			onChange = "feh --bg-fill $HOME/.config/feh/wallpaper.jpg";
		};
	};

	home.packages = [ pkgs.feh ];
}
