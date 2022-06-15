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
      DIRENV_LOG_FORMAT = "";
    };

    home.packages = with pkgs; [
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
      ./direnv
      ./git
      ./neovim
      ./vim
      ./zsh
    ];
  };
}
