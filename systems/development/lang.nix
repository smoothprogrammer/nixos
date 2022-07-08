{ config, pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		# Makefile
		gnumake

		# Lua
		luajit sumneko-lua-language-server

		#Go
		go gopls

		# Nix
		rnix-lsp
	];
}
