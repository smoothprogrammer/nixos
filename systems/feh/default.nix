{ config, pkgs, ... }:

{
  home.packages = [ pkgs.feh ];
  xdg.dataFile."wallpaper/wallpaper.jpg" = {
    source = ./wallpaper.jpg;
  };
}
