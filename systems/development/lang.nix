{ config, pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		# Makefile
		gnumake

		#Go
		go gopls

		# Nix
		rnix-lsp
	];
}
