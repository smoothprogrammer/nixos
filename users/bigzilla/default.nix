{ config, pkgs, ... }:

{
  users.users.bigzilla = {
    isNormalUser = true;
    home = "/home/bigzilla";
    description = "Billy Zaelani Malik";
    initialPassword = "password";
    extraGroups = [ "wheel" "networkmanager" "audio" "docker" "vboxusers" ];
    shell = pkgs.zsh;
  };

  home-manager.users.bigzilla = {
    home.sessionVariables = {
      EDITOR = "vim";
    };

    home.packages = with pkgs; [
      direnv
      gnumake
      lsof
      neofetch
      nixos-option
      slack
      tdesktop
      vscode
      wget
      youtube-dl
      zoom-us
    ];

    imports = [
      ./git
      ./neovim
      ./vim
      ./zsh
    ];

    xdg.configFile = {
      direnv.source = ../../dotfiles/direnv;
    };
  };
}
