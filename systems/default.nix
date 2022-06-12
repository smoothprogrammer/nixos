{ config, pkgs, ... }:

{
  imports = [
    ./home-manager.nix
    ./key
    ./shell
    ./steam
    ./virtualisation
    ./xserver
  ];

  nixpkgs.config.allowUnfree = true;
  time.timeZone = "Asia/Jakarta";
  i18n.defaultLocale = "en_US.UTF-8";
  fonts.fonts = with pkgs; [
    fira-code
    meslo-lgs-nf
  ];
}
