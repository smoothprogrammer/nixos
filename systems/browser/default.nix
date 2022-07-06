{ config, pkgs, ... }:

{
	imports = [
		./brave.nix			# Main browser
		./firefox.nix		# Development browser
		./chrome.nix		# Development browser
	];
}
