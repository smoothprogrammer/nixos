{ config, pkgs, ... }:

{
  users.users.guest = {
    isNormalUser = true;
    home = "/home/guest";
    description = "Guest";
    initialPassword = "password";
    extraGroups = [ "networkmanager" "audio" "video" ];
  };

  home-manager.users.guest = { };
}
