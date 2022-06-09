{ config, pkgs, ... }:

{
  programs.direnv = {
    enable = true;
    config = {
      whitelist = {
        prefix = [
          "/home/bigzilla/coinbit"
          "/home/bigzilla/personal"
        ];
      };
    };
  };
}
