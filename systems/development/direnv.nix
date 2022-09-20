{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ unstable.direnv nix-direnv ];
  environment.pathsToLink = [ "/share/nix-direnv" ];

  nix.extraOptions = ''
    keep-outputs = true
    keep-derivations = true
  '';

  home-manager.sharedModules = [{
    xdg.configFile = {
      "direnv/direnv.toml".source = ../config/direnv/direnv.toml;
      # I'm disabling nix-direnv because it can't invalidate the cache
      # when buildGoModule fields like name, version, and src updated.
      # "direnv/direnvrc".source = ../config/direnv/direnvrc;
    };
  }];
}
