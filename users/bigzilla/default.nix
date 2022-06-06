{ config, pkgs, ... }:

{
  users.users.bigzilla = {
    isNormalUser = true;
    home = "/home/bigzilla";
    description = "Billy Zaelani Malik";
    extraGroups = [ "wheel" "networkmanager" "docker" "vboxusers" ];
    shell = pkgs.zsh;
  };

  home-manager.bigzilla = {
    home.packages = with pkgs; [
      vscode
      slack
      zoom-us
      steam
      youtube-dl
    ];

    imports = [
      ./git.nix
      ./gpg.nix
      ./vim.nix
      ./zsh.nix
    ];
  };
}
