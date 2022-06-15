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
  sound.enable = true;
  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
  };
  fonts.fonts = with pkgs; [
    (nerdfonts.override {
      fonts = [
        "FiraCode" # Fira Code Nerd Font
      ];
    })
  ];
}
