{ config, pkgs, ... }:

{
	programs = {
		# Always enable the shell system-wide. Bash is always enable.
		zsh.enable = true;
	};
}
