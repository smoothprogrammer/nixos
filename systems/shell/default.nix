{ config, pkgs, ... }:

{
  # Always enable the shell system-wide. Bash is always enable.
  programs = {
    zsh.enable = true;
  };

  environment.pathsToLink = [ "/share/zsh" ];
}
    
