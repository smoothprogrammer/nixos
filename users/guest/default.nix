{ config, pkgs, ... }:

{
  users.users.guest = {
    isNormalUser = true;
    home = "/home/guest";
    description = "Guest";
    extraGroups = [ "networkmanager" ];
  };
}
