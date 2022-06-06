{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  virtualisation = {
    docker.enable = true;
    virtualbox.host.enable = true;
  };

  environment.systemPackages = with pkgs; [
    firefox
  ];

  environment.pathsToLink = [ "/share/zsh" ];

  programs = {
    zsh = {
      enable = true;
    };

    steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    };
  };
}
