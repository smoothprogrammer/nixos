{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    extraConfig = {
      init.defaultBranch = "main";
      color.ui = true;
      core.editor = "vim";
    };
    includes = [
      {
        condition = "gitdir:~/coinbit/";
        contents = {
          user = {
            name = "Billy Zaelani Malik";
            email = "billy.malik@coinbit.id";
            signingKey = "billy.malik@coinbit.id";
          };
          url."ssh://git@gitlab.com/".insteadOf = [ "https://gitlab.com/" ];
          commit.gpgsign = true;
          tag.gpgsign = true;
        };
      }
      {
        condition = "gitdir:~/personal/";
        contents = {
          user = {
            name = "Billy Zaelani Malik";
            email = "m.billyzaelani@gmail.com";
          };
          url."ssh://git@github.com/".insteadOf = [ "https://github.com/" ];
        };
      }
    ];
  };
}
