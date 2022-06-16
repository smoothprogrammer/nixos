{ config, pkgs, ... }:

{
  imports = [ <home-manager/nixos> ];

  nixpkgs.config.allowUnfree = true;
  time.timeZone = "Asia/Jakarta";
  i18n.defaultLocale = "en_US.UTF-8";

  fonts.fonts = with pkgs; [
    (nerdfonts.override {
      fonts = [
        "FiraCode" # Fira Code Nerd Font
      ];
    })
  ];

  environment = {
    pathsToLink = [ "/share/zsh" ];
    systemPackages = with pkgs; [
      # Application launcher
      rofi

      # Terminal
      alacritty

      # Status bar
      polybar

      # Image viewer
      feh

      # Browser
      firefox

      # Misc
      psmisc
    ];
  };

  programs = {
    # Shell, always enable the shell system-wide. Bash is always enable.
    zsh.enable = true;

    # Keys
    gnupg.agent.enable = true;
    ssh.startAgent = true;

    # Multimedia
    steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    };
  };

  virtualisation = {
    docker.enable = true;
    virtualbox.host.enable = true;
  };

  services = {
    xserver = {
      enable = true;
      displayManager.defaultSession = "none+bspwm";
      windowManager.bspwm.enable = true;
    };
    picom.enable = true;
  };

  home-manager.sharedModules = [
    {
      home.shellAliases = {
        sudo = "sudo ";
        nixos-rebuild = "nixos-rebuild -I nixos-config=$NIXOS_CONFIG";
      };

      xdg.configFile = {
        bspwm.source = ../dotfiles/bspwm;
        sxhkd.source = ../dotfiles/sxhkd;
        alacritty.source = ../dotfiles/alacritty;
        polybar = {
          source = ../dotfiles/polybar;
          onChange = "$HOME/.config/polybar/launch.sh";
        };
        feh = {
          source = ../dotfiles/feh;
          onChange = "feh --bg-fill $HOME/.config/feh/wallpaper.jpg";
        };
      };
    }
  ];
}
