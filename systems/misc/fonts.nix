{ config, pkgs, ... }:

{
	fonts = {
		fontDir.enable = true;
		enableDefaultFonts = true;
		fonts = with pkgs; [
			(nerdfonts.override {
				fonts = [
					"Meslo" # Meslo LG {S, M, L} Nerd Font
				];
			})
		];
	};
}
