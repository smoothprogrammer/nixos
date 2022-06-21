{ config, pkgs, ... }:

{
	users.users.bigzilla = {
		isNormalUser = true;
		home = "/home/bigzilla";
		description = "Billy Zaelani Malik";
		initialPassword = "password";
		extraGroups = [ "wheel" "networkmanager" "audio" "docker" "vboxusers" ];
		shell = pkgs.zsh;
	};

	home-manager.users.bigzilla = {
		home.sessionVariables = {
			EDITOR = "vim";
		};

		home.shellAliases = {
			ls = "ls -lhF";
			la = "ls -a";
			wifi = "nmcli device wifi";
		};

		home.packages = with pkgs; [
			editorconfig-checker
			gnumake
			neofetch
			nixos-option
			slack
			tdesktop
			vscode
			wget
			youtube-dl
			zoom-us
		];

		imports = [
			./direnv
			./git
			./lang
			./nvim
			./zsh
		];
	};
}
