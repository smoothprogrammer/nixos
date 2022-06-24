{ config, pkgs, ... }:

{
	services = {
		xserver = {
			enable = true;
			displayManager.defaultSession = "none+bspwm";
			windowManager.bspwm.enable = true;
		};
		picom.enable = true;
	};

	home-manager.sharedModules = [{
		xdg.configFile = {
			"bspwm/bspwmrc".source = ./bspwmrc;
			"sxhkd/sxhkdrc".source = ./sxhkdrc;
		};
	}];
}
