{ config, pkgs, ... }:

{
  imports = [
    ./alacritty.nix # Terminal
    ./fish.nix # Shell
  ];
}
