{ config, pkgs, ... }:

{
  imports = [
    ./slack.nix # Workplace
    ./telegram.nix # Messenger
    ./zoom.nix # Video conferencing
  ];
}
