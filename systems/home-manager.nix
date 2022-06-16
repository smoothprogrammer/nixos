{ config, pkgs, ... }:

{
  imports = [
    <home-manager/nixos>
  ];

  home-manager.sharedModules = [
    {
      home.shellAliases = {
        sudo = "sudo ";
        nixos-rebuild = "nixos-rebuild -I nixos-config=$NIXOS_CONFIG";
      };

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
