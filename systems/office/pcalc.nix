{ config, pkgs, ... }:

{
	environment.systemPackages = [ pkgs.programmer-calculator ];
}
