{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autocd = true;
    shellAliases = {
      ls = "ls -lhF";
      la = "ls -a";
      wifi = "nmcli device wifi";
    };
    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    #envExtra = ''
    #  export DIRENV_LOG_FORMAT=
    #'';
    plugins = with pkgs; [
      {
        name = "powerlevel10k";
        src = "${zsh-powerlevel10k}/share/zsh-powerlevel10k";
        file = "powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k-config";
        src = lib.cleanSource ./.;
        file = "p10k.zsh";
      }
    ];
  };
}
