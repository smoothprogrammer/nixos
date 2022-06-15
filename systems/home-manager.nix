{ config, pkgs, ... }:

{
  imports = [
    <home-manager/nixos>
  ];

  home-manager.sharedModules = [
    {
      home.packages = with pkgs; [
        psmisc
      ];

      imports = [
        ./alacritty
        ./feh
        ./firefox
        ./picom
        ./polybar
        ./rofi
      ];
    }
  ];
}
