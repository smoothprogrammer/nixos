{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ alacritty ];

  home-manager.sharedModules = [{
    xdg.configFile = {
      "alacritty/alacritty.yml".source = ../config/alacritty/alacritty.yml;
      "alacritty/dracula.yml".source = ../config/alacritty/dracula.yml;
    };
  }];
}
