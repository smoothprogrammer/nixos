{ config, pkgs, ... }:

{
	home.packages = with pkgs; [
		# Go
		go gopls

		# Nix
		rnix-lsp
	];
}
