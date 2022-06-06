{ config, pkgs, ... }:

{
  users.users.bigzilla = {
    isNormalUser = true;
    home = "/home/bigzilla";
    description = "Billy Zaelani Malik";
    extraGroups = [ "wheel" "networkmanager" "docker" "vboxusers" ];
    shell = pkgs.zsh;
  };

  home-manager.users.bigzilla = {
    home.packages = with pkgs; [
      vscode
      slack
      zoom-us
      youtube-dl
    ];

    imports = [
      ./git
      ./gpg
      ./vim
      ./zsh
    ];
  };
}
