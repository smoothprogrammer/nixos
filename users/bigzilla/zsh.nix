{ config, pkgs, lib, ... }:

{
  programs.zsh = {
    enable = true;
    shellAliases = {
      ls = "ls -lhF";
      la = "ls -a";
    };
    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.fetchFromGitHub {
          owner = "romkatv";
          repo = "powerlevel10k";
          rev = "v1.16.1";
          sha256 = lib.fakeSha256;
        };
      }
    ];
  };
}
