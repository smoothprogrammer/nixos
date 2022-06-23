{ config, pkgs, ... }:

{
	imports = [
		<home-manager/nixos>
		./keys
		./shell
		./steam
		./virtualisation
		./xserver
	];

	home-manager.sharedModules = [{
		imports = [
			./alacritty
			./feh
			./polybar
			./rofi
			./zathura
		];

		home.shellAliases = {
			sudo = "sudo ";
			nixos-rebuild = "nixos-rebuild -I nixos-config=$NIXOS_CONFIG";
		};
	}];

	nixpkgs.config.allowUnfree = true;
	time.timeZone = "Asia/Jakarta";
	i18n.defaultLocale = "en_US.UTF-8";

	fonts = {
		fontDir.enable = true;
		enableDefaultFonts = true;
		fonts = with pkgs; [
			(nerdfonts.override {
				fonts = [
					"FiraCode" # Fira Code Nerd Font
				];
			})
		];
	};

	environment = {
		pathsToLink = [ "/share/zsh" ];
		systemPackages = with pkgs; [
			ranger # File manager
			firefox # Browser
			libreoffice # Office
			psmisc # Misc fuser, killall, prtstat, pslog, pstree, peekfd
		];
	};
}
