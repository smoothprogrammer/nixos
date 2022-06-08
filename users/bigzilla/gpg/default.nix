{ config, pkgs, ... }:

{
  programs.gpg = {
    enable = true;
  };

  services.gpg-agent = {
    enable = true;
    extraConfig = ''
      pinentry-programs ${pkgs.pinentry}/bin/pinentry
    '';
  };
}
