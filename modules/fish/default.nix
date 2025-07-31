{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.conf.fish;
in
{
  options.conf.fish.enable = lib.mkEnableOption "fish";
  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      pkgs.devbox
      pkgs.bat
      pkgs.nitch
      pkgs.zoxide
    ];
    programs.fish.enable = true;
    users.defaultUserShell = pkgs.fish;
    home-manager.sharedModules = [
      {
        programs.fish = {
          enable = true;
          shellAliases = {
            cd = "z";
            cat = "bat";
          };
          shellAbbrs = {
            vimdev = ''vim --cmd "set rtp+=./"'';
            g = "git";
            ga = "git add";
            gb = "git branch";
            gba = "git branch -a";
            gbd = "git branch -d";
            gbD = "git branch -D";
            gc = "git commit";
            gcm = "git commit -m";
            gcsm = "git commit -s -m";
            gca = "git commit --amend";
            gco = "git checkout";
            gl = "git log";
            glo = "git log --oneline";
            gdf = "git diff";
            gpl = "git pull";
            gps = "git push";
            gr = "git remote";
            grv = "git remote -v";
            gs = "git status";
            gt = "git tag";
            gw = "git worktree";
            gwl = "git worktree list";
            gwa = "git worktree add";
            gwr = "git worktree remove";
            zb = "zig build";
          };
          shellInit = ''
            set -g theme_display_date no
            set -g theme_display_git_master_branch yes
            set -g theme_color_scheme dracula
            set -g theme_nerd_fonts yes

            set -x DIRENV_LOG_FORMAT ""
          '';
          interactiveShellInit = ''
            devbox global shellenv --init-hook | source
            direnv hook fish | source
            zoxide init fish | source
            nitch
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
                rev = "06ebe3b9af9af2e30f104b0956e255ca42ed5cab";
                sha256 = "sha256-7G0QSCwZYxNguUot0IVdzbCRFK/6l7WSRIBPOHo3gR0=";
              };
            }
          ];
        };
      }
    ];
  };
}
