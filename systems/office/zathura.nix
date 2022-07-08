{ config, pkgs, ... }:

{
  environment.systemPackages = [ pkgs.zathura ];

  home-manager.sharedModules = [{
    xdg.configFile = {
      "zathura/zathurarc".source = ../config/zathura/zathurarc;
    };
  }];
}
