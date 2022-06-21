{ config, pkgs, ... }:

{
	programs = {
		gnupg.agent.enable = true;
		ssh.startAgent = true;
	};
}
