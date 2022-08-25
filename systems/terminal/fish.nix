{ config, pkgs, ... }:

{
  programs.fish.enable = true;

  home-manager.sharedModules = [{
    programs.fish = {
      enable = true;
      shellAbbrs = {
        rebuild = "sudo nixos-rebuild -I nixos-config=$NIXOS_CONFIG";
        wifi = "nmcli device wifi";
        vimdev = ''vim --cmd "set rtp+=./"'';
        g = "git";
        ga = "git add";
        gb = "git branch";
        gc = "git commit";
        gcm = "git commit -m";
        gca = "git commit --ammend";
        gco = "git checkout";
        gl = "git log";
        glo = "git log --oneline";
        gpl = "git pull";
        gps = "git push";
        gr = "git remote";
        grv = "git remote -v";
        gs = "git status";
        gt = "git tag";
        gw = "git worktree";
      };
      shellInit = ''
        set -g theme_display_date no
        set -g theme_display_git_master_branch yes
        set -g theme_color_scheme dracula
        set -g theme_nerd_fonts yes

        set -x DIRENV_LOG_FORMAT ""
      '';
      interactiveShellInit = ''
        direnv hook fish | source
      '';
      functions = {
        fish_greeting = ""; # Disable greeting
      };
      plugins = [
        {
          name = "theme-bobthefish";
          src = pkgs.fetchFromGitHub {
            owner = "oh-my-fish";
            repo = "theme-bobthefish";
            rev = "14a6f2b317661e959e13a23870cf89274f867f12";
            sha256 = "sha256-kl6XR6IFk5J5Bw7/0/wER4+TnQfC18GKxYbt9C+YHJ0=";
          };
        }
      ];
    };
  }];
}
