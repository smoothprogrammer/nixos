{ config, pkgs, ... }:

{
  imports = [
    <home-manager/nixos>
  ];

  home-manager.sharedModules = [
    {
      imports = [
        ./alacritty
        ./firefox
        ./picom
        ./rofi
      ];
    }
  ];
}
