{ config, pkgs, ... }:

{
	home.packages = [
		# Go
		go gopls

		# Nix
		rnix-lsp
	];
}
