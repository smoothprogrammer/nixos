{ config, pkgs, ... }:

{
	xdg.configFile = {
		"git/config".source = ./config;
		"git/personal".source = ./personal;
		"git/coinbit".source = ./coinbit;
	};

	home.packages = [ pkgs.git ];
}
