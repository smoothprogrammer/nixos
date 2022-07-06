{ config, pkgs, ... }:

{
	users.users.billyzaelani = {
		isNormalUser = true;
		home = "/home/billyzaelani";
		description = "Billy Zaelani Malik";
		initialPassword = "password";
		extraGroups = [ "wheel" "networkmanager" "audio" "video" "docker" "vboxusers" ];
	};

	home-manager.users.billyzaelani = {
		xdg.configFile = {
			"git/config".source = ./git/config;
		};
	};
}
