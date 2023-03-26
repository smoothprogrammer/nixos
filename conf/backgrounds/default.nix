{ config, lib, pkgs, home-manager, ... }:

let
  cfg = config.conf.backgrounds;
in
{
  options.conf.backgrounds = {
    enable = lib.mkEnableOption "backgrounds";
    image = lib.mkOption {
      type = lib.types.path;
      default = ./light-grey.png;
      description = "The image symlink to ~/.background-image.";
    };
  };
  config = lib.mkIf cfg.enable {
    home-manager.sharedModules = [{
      home.file.".background-image".source = cfg.image;
    }];
  };
}
