{ config, pkgs, ... }:

{
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = with pkgs; [ swaylock swayidle ];
  };

  home-manager.sharedModules = [{
    xdg.configFile = {
      "sway/config".source = ../config/sway/config;
      "sway/config.d".source = ../config/sway/config.d;
    };

    xdg.dataFile = {
      "backgrounds/birds-eye-view-of-city.png".source = ../data/backgrounds/birds-eye-view-of-city.png;
    };
  }];
}
