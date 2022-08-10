{ config, pkgs, ... }:

{
  fonts = {
    fontDir.enable = true;
    enableDefaultFonts = true;
    fonts = with pkgs; [
      (nerdfonts.override {
        fonts = [
          "Meslo" # MesloLG{S,M,L}{DZ} Nerd Font {Mono}
        ];
      })
    ];
  };
}
