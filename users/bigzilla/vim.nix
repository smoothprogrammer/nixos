{ config, pkgs, ...}:

{
  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      vim-nix
    ];
    settings = {
      number = true;
      relativenumber = true;
      tabstop = 4;
    };
  };
}
