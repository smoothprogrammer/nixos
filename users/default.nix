{ config, pkgs, ... }:

{
  imports = [
    ./bigzilla # personal
    ./billyzaelani # work
    ./guest
  ];

  users.defaultUserShell = pkgs.fish;
}
