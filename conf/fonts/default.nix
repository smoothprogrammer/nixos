{ config, lib, pkgs, ... }:

let
  cfg = config.conf.fonts;
in
{
  options.conf.fonts.enable = lib.mkEnableOption "fonts";
  config = lib.mkIf cfg.enable {
    fonts = {
      fontDir.enable = true;
      enableDefaultPackages = true;
      packages = with pkgs; [
        (nerdfonts.override {
          fonts = [
            "Meslo" # MesloLG{S,M,L}{_,DZ} Nerd Font {_,Mono}
            "FiraCode" # FiraCode Nerd Font {_,Mono}
          ];
        })
      ];
    };
  };
}
