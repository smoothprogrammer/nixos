{ config, pkgs, ... }:

{
  users.users.bigzilla = {
    isNormalUser = true;
    home = "/home/bigzilla";
    description = "Bigzilla";
    initialPassword = "password";
    extraGroups = [ "wheel" "networkmanager" "audio" "video" "docker" "vboxusers" ];
  };

  home-manager.users.bigzilla = {
    xdg.configFile = {
      "git/config".source = ./git/config;
    };
  };
}
