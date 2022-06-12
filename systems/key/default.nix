{ config, pkgs, ... }:

{
  programs = {
    ssh = {
      startAgent = true;
    };
    gnupg = {
      agent.enable = true;
    };
  };
}
