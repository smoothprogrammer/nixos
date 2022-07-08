{ config, pkgs, ... }:

{
  imports = [
    ./steam.nix # Game
    ./feh.nix # Image viewer
    ./mpv.nix # Video player
    ./cmus.nix # Music player
    ./gimp.nix # Raster graphic editor
    ./inkscape.nix # Vector graphic editor
    ./obs.nix # Video recording and live streaming
    ./blender.nix # Video editing and 3D modeler
  ];
}
