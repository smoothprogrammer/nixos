{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.conf.fonts;
in
{
  options.conf.fonts.enable = lib.mkEnableOption "fonts";
  config = lib.mkIf cfg.enable {
    fonts = {
      fontDir.enable = true;
      enableDefaultPackages = true;
      packages = with pkgs.nerd-fonts; [
        meslo-lg # MesloLG{S,M,L}{_,DZ} Nerd Font {_,Mono}
        jetbrains-mono # JetBrainsMono{_,NL} Nerd Font {_,Mono,Propo}
      ];
    };
  };
}
