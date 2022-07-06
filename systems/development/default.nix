{ config, pkgs, ... }:

{
	imports = [
		./git.nix			# Version control
		./nvim.nix			# Text editor and IDE
		./lang.nix			# List of programming language
		./docker.nix		# container
		./virtualbox.nix	# Virtual machine
		./direnv.nix		# Virtual environment
		./keys.nix			# SSH and GPG
	];
}
