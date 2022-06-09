{ config, pkgs, ... }:

let
  version = "21.11";
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/refs/heads/release-${version}.tar.gz";
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.sharedModules = [
    {
      imports = [
        ./alacritty
        ./firefox
      ];
    }
  ];
}
