{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ direnv nix-direnv ];
  environment.pathsToLink = [ "/share/nix-direnv" ];

  nix.extraOptions = ''
    keep-outputs = true
    keep-derivations = true
  '';

  home-manager.sharedModules = [{
    xdg.configFile = {
      "direnv/direnv.toml".source = ../config/direnv/direnv.toml;
      "direnv/direnvrc".source = ../config/direnv/direnvrc;
    };
  }];
}
