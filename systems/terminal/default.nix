{ config, pkgs, ... }:

{
  imports = [
    ./foot.nix # Terminal
    ./fish.nix # Shell
  ];
}
