{ config, pkgs, ... }:

let
  version = "21.11";
in
{
  imports = [
    ./home-manager.nix
    ./shell
    ./steam
    ./virtualisation
    #./xserver
  ];

  system.stateVersion = version;
  nixpkgs.config.allowUnfree = true;
  time.timeZone = "Asia/Jakarta";
  i18n.defaultLocale = "en_US.UTF-8";
  fonts.fonts = with pkgs; [
    meslo-lgs-nf
  ];
}
