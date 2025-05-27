{
  config,
  lib,
  pkgs,
  user,
  ...
}:

let
  cfg = config.conf.firefox;
in
{
  options.conf.firefox.enable = lib.mkEnableOption "firefox";
  config = lib.mkIf cfg.enable {
    home-manager.sharedModules = [
      {
        programs.firefox = {
          enable = true;
          profiles.${user} = {
            id = 0;
            isDefault = true;
            extraConfig = builtins.readFile ./user.js;
            bookmarks = {
              force = true;
              settings = import ./bookmarks.nix;
            };
            search = import ./search-engines.nix { inherit pkgs; };
          };
        };
      }
    ];
  };
}
