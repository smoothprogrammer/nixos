{ config, pkgs, ... }:

{
	imports = [
		./bigzilla
		./guest
	];

	users.defaultUserShell = pkgs.fish;
}
