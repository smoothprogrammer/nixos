{ config, pkgs, ... }:

{
  users.users.bigzilla = {
    isNormalUser = true;
    home = "/home/bigzilla";
    description = "Billy Zaelani Malik";
    initialPassword = "password";
    extraGroups = [ "wheel" "networkmanager" "docker" "vboxusers" ];
    shell = pkgs.zsh;
  };

  home-manager.users.bigzilla = {
    home.packages = with pkgs; [
      gnumake
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
      ./gpg
      ./vim
      ./zsh
    ];
  };
}
