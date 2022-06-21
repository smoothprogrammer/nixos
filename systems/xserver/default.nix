{ config, pkgs, ... }:

{
	services = {
		xserver = {
			enable = true;
			displayManager.defaultSession = "none+bspwm";
			windowManager.bspwm = {
				enable = true;
				configFile = ./bspwmrc;
				sxhkd.configFile = ./sxhkdrc;
			};
		};
		picom.enable = true;
	};
}
